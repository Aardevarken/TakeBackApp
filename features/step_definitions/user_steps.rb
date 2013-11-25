def sign_in
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit signup_path
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Create my account"
  find_user
end


Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^she submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^she should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^she should see her profile page$/ do
  expect(page).to have_selector('title', :text => @user.name)
end

Then /^she should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

Given(/^I am logged in$/) do
  sign_in
end

When(/^I sign out$/) do
	click_link "Sign out"
end

Then(/^I should see the signin link$/) do
expect(page).to have_link('Sign in', href: signin_path)
end

Given(/^I am not logged in$/) do
  visit root_path
  expect(page).to have_link('Sign in', href: signin_path)
end

When(/^I sign up with valid user data$/) do
  create_visitor
  sign_up
end

Then(/^I should see a signout link$/) do
  expect(page).to have_link('Sign out', href: signout_path)
end

When(/^I sign up with an invalid email$/) do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

Then(/^I should see an error message$/) do
  expect(page).to have_selector('div.alert.alert-error')
end

Then(/^I should still be on the signup page$/) do
  expect(page).to have_selector('title', :text => "Sign up")
end

When(/^I sign up without a password$/) do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When(/^I sign up without a password confirmation$/) do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When(/^I sign up with a mismatched password confirmation$/) do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end
