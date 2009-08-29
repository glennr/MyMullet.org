require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :full_name => "value for full_name",
      :user_name => "value for user_name",
      :email => "value for email",
      :password => "value for password",
      :recaptcha => false,
      :newsletter => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ full_name/)
    response.should have_text(/value\ for\ user_name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/false/)
    response.should have_text(/false/)
  end
end
