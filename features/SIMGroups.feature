  @SIMGroup
  Feature: SIM Management
  This feature covers complete SIM management functionality.


     #This test case is passed
     @SIMGRP_CREATE
     Scenario: Create New SIM Group - Customer User
       Given test case starts
       Given browser is open
       Then login
       When click on link "USE_User_OperatorAdministratorRole"
       When click on link "USE_User_CustomerAdministratorRole"
       When click on menu "Administration"
       When click on submenu "My organisation"
       Then verify text "Overview"
       When click on tab "Details"
       When click on link "Profiles and groups"
       Then verify
       | type  | value  |
       | button  | Edit   |
       When click on button "Edit"
       When click on link "+ Add group"
       Then enter "* Name" "USE_SIMGroup_GroupName"
       Then enter "Description" "USE_SIMGroup_Description"
       When click on button "Save"
       Then verify text "Groups"
       #Then verify text "USE_SIMGroup_GroupName"
       Then logout


     @SIMGRP_ADD_DEVICE
     #This test case is passed
     Scenario: Add device to a SIM Group - OPCO User
       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_SIMGroup_IMSI"
       When click on button "Search"
       When click on link "USE_SIMGroup_IMSI"
       Then verify text "Overview"
       When click on tab "Operations"
       When click on link "Configure"
       When click on link "Set groups"
       Then select dropdown "Groups" "USE_SIMGroup_GroupName"
       Then When click on button "Set"
       | type  | value  |
       | text  | were successfully set|
       Then logout

