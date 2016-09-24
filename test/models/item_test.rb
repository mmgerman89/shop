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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
