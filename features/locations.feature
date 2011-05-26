Feature: Manage Locations
  As a administraator
  I want to manage locations

  Background:
    Given the following locations exists:
      | Name             |
      | Reference Desk   |
      | Circulation Desk |
    And   I am on the home page
    And   I follow "Locations"

  # Index
  Scenario: The page should have a title, action items, and breadcrumbs.
    Then I should see the title "Locations"
    And  I should see an "Add Location" action item
    And  I should see the following breadcrumbs:
      | text |
      | Home |

  Scenario: It should list all the locations
    Then I should see the following table rows:
      | Name             |
      | Reference Desk   | 
      | Circulation Desk |

  # Show
  Scenario: Showing an individual location
    When I follow "Reference Desk"
    Then I should see the title "Reference Desk"
    And  I should see an "Edit Location" action item
    And  I should see a "Delete Location" action item
    And  I should see the following breadcrumbs:
      | text      |
      | Home      |
      | Locations |
    And  I should see the following table rows:
      | Name | Reference Desk |

  # Edit
  Scenario: Editing an individual location
    When I follow "Reference Desk"
    And  I follow "Edit Location"
    Then I should see the title "Edit Location"
    #And  I should see a "Update Location" action item
    And  I should see a "Cancel" action item
    And  I should see the following breadcrumbs:
      | text           |
      | Home           |
      | Locations      |
      | Reference Desk | 
    And  the "Name" field should contain "Reference Desk"
    When I fill in "Name" with "Reference Desk, 4th Floor"
    And  I press "Update Location"
    Then I should see "The location has successfully been updated."

  Scenario: Editing a location to not have a name
    When I follow "Reference Desk"
    And  I follow "Edit Location"
    And  I fill in "Name" with ""
    And  I press "Update Location"
    Then I should see "There was a problem updating the location."

  # New
  Scenario: Adding a new location
    When I follow "Add Location"
    Then I should see the title "New Location"
    And  I should see the following breadcrumbs:
      | text           |
      | Home           |
      | Locations      |
    When I fill in "Name" with "Archives"
    And  I press "Add Location"
    Then I should see "The location was successfully added."

  Scenario: Adding a location without a name
    When I follow "Add Location"
    And  I fill in "Name" with ""
    And  I press "Add Location"
    Then I should see "There was a problem adding the location."

  # Delete
  Scenario: Deleting a location
    When I follow "Reference Desk"
    And  I follow "Delete Location"
    Then I should see "The location was successfully deleted."
