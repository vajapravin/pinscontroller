# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
	has_many :product_categories, :dependent => :destroy
    has_many :products, :through => :product_categories
end
