require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'factory_girl'

describe User do
  before(:each) do
  end

  it "should succeed creating a new :valid_user from the Factory" do
    Factory.create(:user)
  end
end
