Factory.define :user , :class => User do |u|
  u.sequence(:login) { |n| "factory_user_#{n}" }
  u.sequence(:email) { |n| "factory_user_#{n}@gmail.com" }
  u.password "mathieu"
  u.password_confirmation { |u| u.password }
end