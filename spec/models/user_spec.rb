require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :full_name => "value for full_name",
      :user_name => "value for user_name",
      :email => "value for email",
      :password => "value for password",
      :recaptcha => false,
      :newsletter => false
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
