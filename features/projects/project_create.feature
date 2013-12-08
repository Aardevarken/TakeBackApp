Feature: User can create a project

Scenario: User creates a project
  Given I am logged in
  When I follow "Add New Project"
  Then I should see "Title"
  And I should see "Description"
  And I should see "Location"
  When I fill in "Title" with "New Project"
  And I fill in "Description" with "This is a new Project"
  And I fill in "Location" with "Boulder"
  And I press "Save Project"
  Then I should be on the home page
