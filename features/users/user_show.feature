Feature: Show Users


Scenario: Viewing users
  Given I am logged in
  When I follow "Users"
  Then I should see "Example User"