@Tedting
Feature: Test


  @new
    Scenario: Test to verify that the field SIM State Change Reason  appers while changing state only if it is enabled in customer configuration
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "111110001000000"
      When click on button "Search"
      When click on link "111110001000000"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Change state"
      When click on expand link "Select an option"