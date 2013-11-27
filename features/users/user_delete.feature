Feature: Admin user is able to delete users


Background:
  Given there is at least one registered user

Scenario: Admin user deletes a user
  Given I am logged in as an admin
  When I follow "Users"
  Then I should see "delete"
  When I follow "delete"
  Then I should see "User deleted."