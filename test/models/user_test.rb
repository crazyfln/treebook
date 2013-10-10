require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "a user should enter a first name" do
   	  user = User.new
      assert !user.save
      assert !user.errors[:first_name].empty?
    end

    test "a user should have a unique profile name" do
    	user = User.new
    	user.profile_name = users(:linan).profile_name
 
    	assert !user.save

    	assert !user.errors[:profile_name].empty?
    end

    test "a profile name should have no space" do
    	user = User.new
    	user.profile_name = "Wa Ha Ha"
    	assert !user.save
    	assert !user.errors[:profile_name].empty?
    	assert user.errors[:profile_name].include?("Please format correctly")
    end
end
