# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  number     :integer
#  item_id    :integer
#  qty        :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SaleDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
