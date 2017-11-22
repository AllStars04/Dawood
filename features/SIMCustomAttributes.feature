@CustomAttr
Feature: SIM Management
 This feature covers complete SIM management functionality.

    @SIMCustomAttributes_enable_custom_attr
    #This test case is passed
    Scenario: Enable Custom attributes and make available for customer - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then verify text "Results"
      Then enter "Organisation" "USE_CustomAttributes_Organisation"
      When click on button "Search"
      Then verify text "USE_CustomAttributes_Organisation"
      When click on link "USE_CustomAttributes_Organisation"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit"
      Then enter "Custom attributes" "USE_CustomAttributes_CustomAttribute1"
      When click on button "Save"
      Then verify text "USE_CustomAttributes_CustomAttribute1"
      Then logout


    @SIMCustomAttributes_CONFIGURE_ATTR_TO_SIM
    #This test case is passed
    Scenario: Configure custom attributes for search a SIM - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_CustomerAdministratorRole"
      Then verify text "Devices"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomAttributes_IMSI"
      When click on button "Search"
      When click on link "USE_CustomAttributes_IMSI"
      When click on button "Edit"
      Then enter "USE_CustomAttributes_CustomAttribute1" "USE_CustomAttributes_CA1Value"
      When click on button "Save"
      Then verify text "Overview"
      Then verify text "USE_CustomAttributes_CA1Value"
      Then verify text "Devices"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "USE_CustomAttributes_CustomAttribute1"
      Then logout



    @SIMCustomAttributes_view_custom_attr_for_SIM
    #This test case is passed
    Scenario: View Custom attributes for SIM - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomAttributes_IMSI"
      When click on button "Search"
      When click on link "USE_CustomAttributes_IMSI"
      Then verify text "USE_CustomAttributes_CustomAttribute1"
      Then verify text "USE_CustomAttributes_CA1Value"
      Then logout

