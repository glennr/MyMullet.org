Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Full name" with "full_name 1"
    And I fill in "User name" with "user_name 1"
    And I fill in "Email" with "email 1"
    And I fill in "Password" with "password 1"
    And I fill in "Recaptcha" with "false"
    And I fill in "Newsletter" with "false"
    And I press "Create"
    Then I should see "full_name 1"
    And I should see "user_name 1"
    And I should see "email 1"
    And I should see "password 1"
    And I should see "false"
    And I should see "false"

  Scenario: Delete user
    Given the following users:
      |full_name|user_name|email|password|recaptcha|newsletter|
      |full_name 1|user_name 1|email 1|password 1|false|false|
      |full_name 2|user_name 2|email 2|password 2|true|true|
      |full_name 3|user_name 3|email 3|password 3|false|false|
      |full_name 4|user_name 4|email 4|password 4|true|true|
    When I delete the 3rd user
    Then I should see the following users:
      |Full name|User name|Email|Password|Recaptcha|Newsletter|
      |full_name 1|user_name 1|email 1|password 1|false|false|
      |full_name 2|user_name 2|email 2|password 2|true|true|
      |full_name 4|user_name 4|email 4|password 4|true|true|
