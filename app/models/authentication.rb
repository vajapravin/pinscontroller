# == Schema Information
#
# Table name: authentications
#
#  id          :integer          not null, primary key
#  uid         :string(255)
#  user_id     :integer
#  provider    :string(255)
#  auth_token  :string(255)
#  expiry_time :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Authentication < ActiveRecord::Base
  belongs_to :user
end
