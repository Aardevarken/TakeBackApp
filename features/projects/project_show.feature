Feature: User can see all of his projects

Background:
  Given I am logged in
  And I have created a project

Scenario:
  Given I am on the user profile page
  When I follow "List of My Projects"
  I should should see "delete"
