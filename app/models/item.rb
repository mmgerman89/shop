# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  code        :string
#  description :string
#  brand_id    :integer
#  unit_id     :integer
#  stock       :integer
#  min_stock   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  price       :decimal(8, 2)
#

class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :unit
  belongs_to :category

  validates :description, presence: true

  def item_description
  	self.description + ( (self.brand != nil) ? ' ' + self.brand.name : '' )
  end

  def brand_name
  	if self.brand
  		self.brand.name
  	else
  		''
  	end
  end
end
