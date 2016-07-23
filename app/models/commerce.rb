# == Schema Information
#
# Table name: commerces
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Commerce < ApplicationRecord
	belongs_to :user
end
