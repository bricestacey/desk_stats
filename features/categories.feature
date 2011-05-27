Feature: Manage Categories
  As a administraator
  I want to manage categories

  Background:
    Given the following categories exists:
      | Name      |
      | Reference |
      | General   |
    And   I am on the admin page
    And   I follow "Categories"

  # Index
  Scenario: The page should have a title, action items, and breadcrumbs.
    Then I should see the title "Categories"
    And  I should see an "Add Category" action item
    And  I should see the following breadcrumbs:
      | text |
      | Home |

  Scenario: It should list all the categories
    Then I should see the following table rows:
      | Name      |
      | Reference | 
      | General   |

  # Show
  Scenario: Showing an individual category
    When I follow "Reference"
    Then I should see the title "Reference"
    And  I should see an "Edit Category" action item
    And  I should see a "Delete Category" action item
    And  I should see the following breadcrumbs:
      | text       |
      | Home       |
      | Categories |
    And  I should see the following table rows:
      | Name | Reference |

  # Edit
  Scenario: Editing an individual category
    When I follow "Reference"
    And  I follow "Edit Category"
    Then I should see the title "Edit Category"
    #And  I should see a "Update Category" action item
    And  I should see a "Cancel" action item
    And  I should see the following breadcrumbs:
      | text           |
      | Home           |
      | Categories     |
      | Reference | 
    And  the "Name" field should contain "Reference"
    When I fill in "Name" with "Reference - Online"
    And  I press "Update Category"
    Then I should see "The category was successfully updated."

  Scenario: Editing a category to not have a name
    When I follow "Reference"
    And  I follow "Edit Category"
    And  I fill in "Name" with ""
    And  I press "Update Category"
    Then I should see "There was a problem updating the category."

  # New
  Scenario: Adding a new category
    When I follow "Add Category"
    Then I should see the title "New Category"
    And  I should see the following breadcrumbs:
      | text           |
      | Home           |
      | Categories     |
    When I fill in "Name" with "Phone Call"
    And  I press "Add Category"
    Then I should see "The category was successfully added."

  Scenario: Adding a category without a name
    When I follow "Add Category"
    And  I fill in "Name" with ""
    And  I press "Add Category"
    Then I should see "There was a problem adding the category."

  # Delete
  Scenario: Deleting a category
    When I follow "Reference"
    And  I follow "Delete Category"
    Then I should see "The category was successfully deleted."
