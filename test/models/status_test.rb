require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status's content is as least 2 letters" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status must have a user id" do
  	status = Status.new
  	status.content = "HHH"
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end
end
