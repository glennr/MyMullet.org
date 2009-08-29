class User < ActiveRecord::Base  
  acts_as_authentic do |c|
    c.login_field = :login
    c.email_field = :email
    c.validates_length_of_password_field_options = {:minimum => 4, :on => :update, :if => :has_no_credentials?}
    c.validates_confirmation_of_password_field_options = {:minimum => 4, :on => :update, :if => (password_salt_field ? "#{password_salt_field}_changed?".to_sym : nil)}
    c.validates_length_of_password_confirmation_field_options = {:minimum => 4, :on => :update, :if => :has_no_credentials?}
  end
  
end
