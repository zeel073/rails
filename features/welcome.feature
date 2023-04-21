Feature: Welcome Feature
  As a user
  I want to visit the homepage
  So that I can see the welcome message

  Background:
    Given I am logged in

  Scenario: Greeting messages
    Given I am on the homepage
    Then I should see "Welcome to my app"

  Scenario: Products section
    Given I am on the products page
    Then I should see "Welcome to our products section"

  Scenario: Viewing student details
    Given I am on the homepage
    When I click on student's name
    Then I should see details of that student

  Scenario: Creating new students
    Given I am on the homepage
    When I click on Create new record option
    And Create new record
    Then I should redirected to new student's show page
    And I should see "Student was successfully created."