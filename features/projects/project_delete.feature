Feature: User can delete his own project

Background:
  Given I am logged in
  And I have created a project


Scenario: User deletes a project
  Given I am on the user profile page
  When I follow "List of My Projects"
  When I follow "delete"
  Then I should see "Project Deleted Successfully"