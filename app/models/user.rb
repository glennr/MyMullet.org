class User < ActiveRecord::Base 
  acts_as_authentic
  validates_presence_of :login, :email, :password
  validates_uniqueness_of :login, :email
  validates_presence_of  :password_confirmation, :on => [:create]
  validates_length_of   :email,                             :within => 6..100
  validates_length_of   :password, :password_confirmation,  :within => 6..64
end
