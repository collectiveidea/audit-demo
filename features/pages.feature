Feature: Pages

  Scenario: Creating a new page
    When I create a new page titled "Hello World"
    Then I can see a page title "Hello World" exists
    And I can see the page titled "Hello World" has 1 revision
    
  Scenario: Updating an existing page
    Given a page titled "acts_as_audited demo"
    When I rename the page titled "acts_as_audited demo" to "updated"
    Then I can see a page title "updated" exists
    And I can see the page titled "updated" has 2 revisions
  
  Scenario: Reverting a change
    Given a page titled "Revisioning"
    When I rename the page titled "Revisioning" to "Spammed!"
    Then I can see a page title "Spammed!" exists
    
    When I revert the page titled "Spammed!" to revision 1
    Then I can see a page title "Revisioning" exists
