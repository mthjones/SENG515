require 'spec_helper'

describe User do
   before { @user = User.new(email: "TestEmail@gmail.com", 	
   									password: "TestPassword" ,
  									user_type: "Admin")}

  subject { @user }

  it { should respond_to(:email }
  it { should respond_to(:passworld) }
  it { should respond_to(:user_type) }

  # Make sure user is initially valid before testing validations
  it { should be_valid }
  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  it { should be_valid }
  describe "when password is not present" do
  	before { @user.password = nil }
  	it { should_not be_valid }
  end

  it { should be_valid }
  describe "when user_type is not present" do
  	before { @user.user_type = nil }
  	it { should_not be_valid }
  end
end
