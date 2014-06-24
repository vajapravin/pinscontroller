# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
end
