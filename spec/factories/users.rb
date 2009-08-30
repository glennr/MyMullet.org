Factory.define :user , :class => User do |u|
  u.login "mathieu"
  u.email "mathieu@gmail.com"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end