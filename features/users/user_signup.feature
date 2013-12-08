Feature: User can create an account with the TakeBackApp

	As a potential TakeBackApp user
	In order to access the app and create projects
	I want to be able to sign-up for the app

Background:
  Given I am not logged in

Scenario: User signs up with valid data
  When I sign up with valid user data
  Then I should see a signout link

Scenario: User signs up with invalid email
	When I sign up with an invalid email
	Then I should see an error message
	And I should see "Sign up"

Scenario: User signs up without password
	When I sign up without a password
	Then I should see an error message
	And I should see "Sign up"

Scenario: User signs up without password confirmation
    When I sign up without a password confirmation
    Then I should see an error message
    And I should see "Sign up"

Scenario: User signs up with mismatched password and confirmation
    When I sign up with a mismatched password confirmation
    Then I should see an error message
    And I should see "Sign up"
