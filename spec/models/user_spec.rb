require 'spec_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe "User authenticate method" do
	before(:all) do
 	 @user = User.create!(email: "coder@skillcrush", password: "secret", last_name: "Last", first_name: "First")
	end
 
	after(:all) do
	  if !@user.destroyed?
 	   @user.destroy
  	end
end

it { should validate_presence_of(:first_name) }
 
it 'authenticates and returns a user when valid email and password passed in' do
	authenticate_user = User.authenticate(@user.email, @user.password)
	expect(authenticate_user).to eql(@user)
end



############################ The Last End ############################
end