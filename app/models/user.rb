class User < ActiveRecord::Base 
  
  validates_presence_of :login, :email, :password, :password_confirmation
  #validates_length_of   :email,                             :within => 6..100
  #validates_length_of   :password, :password_confirmation,  :within => 6..64
  
  acts_as_authentic do |c|
    c.login_field = :login
    c.email_field = :email
    c.validates_length_of_password_field_options              = {:minimum => 6}
    c.validates_length_of_password_confirmation_field_options = {:minimum => 6}
    c.validates_confirmation_of_password_field_options = {:minimum => 6, :if => (password_salt_field ? "#{password_salt_field}_changed?".to_sym : nil)}
  end
  
  
  private
  
  def has_no_credentials?
    logger.debug("User filter:  self.crypted_password.blank? = #{self.crypted_password.blank?} ")
    self.crypted_password.blank?
  end
  
end
