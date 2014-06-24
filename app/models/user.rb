# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  avatar                 :string(255)
#  is_closed              :boolean
#  is_admin               :boolean
#  created_at             :datetime
#  updated_at             :datetime
#  address                :string(255)
#

class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    has_many :authentications
    mount_uploader :avatar, AvatarUploader
    acts_as_voter
    def apply_omniauth(omniauth)
		if omniauth[:provider] == 'facebook'
			self.email = omniauth[:extra][:raw_info][:email] if self.email.blank?
		end
		authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
	end

	def skip_confirmation!
		self.confirmed_at = Time.now
	end

	def email_to_name
		name = self.email[/[^@]+/]
		name.split(".").map {|n| n.capitalize }.join(" ")
	end

	def alias_name
		name = (!self.first_name.nil? || !self.last_name.nil?) ? get_name : self.email_to_name.titlecase
		name
	end

	def get_name
		name = ""
		if !self.first_name.nil?
			name = self.first_name.titlecase + " "
		end
		if !self.last_name.nil?
			name += self.last_name.titlecase
		end
		name
	end

	def voted product
		(self.voted_up_on? product) ? "like" : "dislike"
	end
end
