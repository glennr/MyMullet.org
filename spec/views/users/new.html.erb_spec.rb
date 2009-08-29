require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :full_name => "value for full_name",
      :user_name => "value for user_name",
      :email => "value for email",
      :password => "value for password",
      :recaptcha => false,
      :newsletter => false
    )
  end

  it "renders new user form" do
    render

    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_full_name[name=?]", "user[full_name]")
      with_tag("input#user_user_name[name=?]", "user[user_name]")
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_password[name=?]", "user[password]")
      with_tag("input#user_recaptcha[name=?]", "user[recaptcha]")
      with_tag("input#user_newsletter[name=?]", "user[newsletter]")
    end
  end
end
