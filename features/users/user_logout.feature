Feature: Sign out

Scenario: User signs out
	Given I am logged in
	When I sign out
	Then I should see the signin link