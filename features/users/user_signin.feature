Feature: User can sign-in to the TakeBackApp once they have an account

	As a current user of TakeBack
	So that I can access and create projects
	I want to be able to sign-in to the site

Scenario: Unsuccessful signin
  Given a user visits the signin page
  When she submits invalid signin information
  Then she should see an error message

Scenario: Successful signin
  Given a user visits the signin page
  And the user has an account
  When the user submits valid signin information
  Then she should see her profile page
  And she should see a signout link