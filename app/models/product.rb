# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  link       :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  price      :float            default(0.0)
#

class Product < ActiveRecord::Base
	has_many :product_categories, :dependent => :destroy
    has_many :categories, :through => :product_categories
    acts_as_votable
    mount_uploader :image, AvatarUploader
    after_create :generate_slug

    def generate_slug
    	self.slug = "#{self.id}-#{self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
        self.save
    end

    def votes
    	self.get_upvotes.size - self.get_downvotes.size
    end
end
