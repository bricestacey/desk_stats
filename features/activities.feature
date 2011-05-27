Feature: Track activity at a Desk
  As a user
  I want to track activity at a service desk

  Background:
    Given the following categories exists:
      | Name      |
      | General   |
      | Reference |
    And   the following locations exists:
      | Name             |
      | Circulation Desk |
      | Reference Desk   |
    And   I am on the home page
    And   I have selected the "Circulation Desk" location

  Scenario: I should see a list of categories to choose from
    Then I should see "General"
    And  I should see "Reference"

  # New
  Scenario: I should be able to track an activity by clicking a category
    When I follow "General"
    Then I should see "You have successfully tracked an activity."
