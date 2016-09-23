# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user1 = User.new(email: "user1@tests.com", password: "password")
  	@user1.save!
  	@user2 = User.new(email: "user1@tests.com", password: "password")
  	@user3 = User.new(email: "user3@tests.com", password: "12345")
  end

  test "should be valid" do
  	assert @user1.valid?
  end

  test "should not be valid" do
  	assert !@user2.valid?
  end

  test "password too short" do
  	assert !@user3.valid?
  end
end
