Feature: Manage Users
  In order to Increase Revenue from mullets & sponsors
  As a Board
  I want guests
  To be able to log in and create profiles to participate in MyMullet

Scenario: Sign up user
  Given I am on the homepage
  And I follow "Sign Up"
  Then I should see "Join MyMullets.org"
  
Scenario: Register a new user
  Given I am on the new user page
  When I fill in "Login" with "glenn_1"
  When I fill in "Email" with "glenn@glenn.com"
  And I fill in "Password" with "password"
  And I fill in "Password Confirmation" with "pass"
  And I press "Register"
  Then I should see "Dashboard"

