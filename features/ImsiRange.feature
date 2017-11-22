@ImsiRange
Feature: IMSI Range
This feature covers complete SIM management functionality.

    @TC_SIM_PRVSNG_Create_IMSI_RANGE
    #This test case is passed
    Scenario: Create IMSI Range - Platform Admin
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify
      | type  | value  |
      | button  | Create IMSI range   |
      When click on button "Create IMSI range"
      Then verify text "Information"
      Then enter "* Description" "USE_IMSIRange_DescriptionGlobal"
      Then select dropdown "* Range type" "USE_IMSIRange_RangeTypeGlobal"
      Then enter "* IMSI start" "USE_IMSIRange_IMSIStart"
      Then enter "* IMSI end" "USE_IMSIRange_IMSIEnd"
      When click on button "Next"
      Then verify text "You're about to create the IMSI range"
      When click on button "Create"
      Then verify text "The IMSI range was successfully created!"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on link "USE_User_OperatorAdministratorRole"
      Then verify text "Updated on"
      Then logout

 
    @TC_SIM_PRVSNG_Edit_IMSI_RANGE
    #This test case is passed
    Scenario: Edit IMSI Range - Platform Admin
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify text "Results"
      Then enter "Next available IMSI" "USE_IMSIRange_NextAvailableIMSI"
      When click on button "Search"
      Then verify text "USE_IMSIRange_NextAvailableIMSI"
      When click on link "USE_IMSIRange_NextAvailableIMSI"
      When click on button "Edit"
      Then enter "* Description" "USE_IMSIRange_DescriptionEdit"
      When click on button "Save"
      Then verify text "USE_IMSIRange_DescriptionEdit"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on link "USE_User_OperatorAdministratorRole"
      Then verify text "Updated on"
      Then logout




    @TC_SIM_PRVSNG_Create_IMSI_RANGE_OPCO
    #This test case is passed
    #Failing at the point of selection PPVGE
    Scenario: Create IMSI Range for OPCO- Platform Admin
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify text "Results"
      | type | value  |
      | button | Create IMSI range |
      When click on button "Create IMSI range"
      Then verify text "Information"
      Then enter "* Description" "USE_IMSIRange_DescriptionOpco"
      Then select dropdown "Range type" "USE_IMSIRange_RangeTypeOpco"
#      When click on input "* Organisation" and enter value "USE_IMSIRange_OrganisationOPCO"
      When click on input "* Organisation" and enter value "PPVFNL"
      Then enter "* IMSI start" "USE_IMSIRange_IMSIStart"
      Then enter "* Amount" "USE_IMSIRange_SIMAmount"
      When click on button "Next"
      Then verify text "You're about to create the IMSI range"
      When click on button "Create"
      Then verify text "The IMSI range was successfully created!"
      When click on link "USE_User_PlatformAdministratorRole"
      When click on link "USE_User_OperatorAdministratorRole"
      Then verify text "Updated on"
      Then logout


    @TC_SIM_PRVSNG_View_IMSI_RANGE_OPCO
    #This test case is passed
    Scenario: View IMSI Range for OPCO- OPCO Admin
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then select dropdown "Range type" "USE_IMSIRange_RangeTypeOpco"
      When click on input "Organisation" and enter value "USE_IMSIRange_OrganisationOPCO"
      When click on button "Search"
      Then verify text "USE_IMSIRange_IMSIStart"
      Then logout



    @TC_SIM_PRVSNG_Create_IMSI_RANGE_Customer
    #This test case is passed
    Scenario: Create IMSI Range for Customer- OPCO Admin
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify
      | type  | value  |
      | button  | Create IMSI range   |
      When click on button "Create IMSI range"
      Then verify text "Information"
      Then enter "* Description" "USE_IMSIRange_DescriptionCust"
      When click on input "Organisation" and enter value "USE_IMSIRange_OrganisationCust"
      Then enter "* IMSI start" "USE_IMSIRange_IMSIStart"
      Then enter "* Amount" "USE_IMSIRange_SIMAmount"
      When click on button "Next"
      Then verify text "You're about to create the IMSI range"
      When click on button "Create"
      Then verify text "The IMSI range was successfully created!"
      Then logout


    @TC_SIM_PRVSNG_Edit_IMSI_RANGE_OPCO
    #This test case is passed
    Scenario: Edit IMSI Range for OPCO- OPCO Admin
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify text "Results"
      Then enter "Next available IMSI" "USE_IMSIRange_NextAvailableIMSI"
      Then select dropdown "Range type" "USE_IMSIRange_RangeTypeCust"
      When click on input "Organisation" and enter value "USE_IMSIRange_OrganisationCust"
      When click on button "Search"
      Then verify text "USE_IMSIRange_NextAvailableIMSI"
      When click on link "USE_IMSIRange_NextAvailableIMSI"
      When click on button "Edit"
      Then enter "* Description" "USE_IMSIRange_DescriptionEdit"
      When click on button "Save"
      Then verify text "USE_IMSIRange_DescriptionEdit"
      Then logout



    @TC_SIM_PRVSNG_Delete_IMSI_RANGE_OPCO
    #This test case is passed
    Scenario: Delete IMSI Range for OPCO- OPCO Admin
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "IMSI ranges"
      Then verify text "Results"
      Then enter "Next available IMSI" "USE_IMSIRange_NextAvailableIMSI"
      Then select dropdown "Range type" "USE_IMSIRange_RangeTypeCust"
      When click on input "Organisation" and enter value "USE_IMSIRange_OrganisationCust"
      When click on button "Search"
      Then verify text "USE_IMSIRange_NextAvailableIMSI"
      When click on link "USE_IMSIRange_NextAvailableIMSI"
      When click on button "Delete range"
      Then verify text "You are about to delete the IMSI range"
      When click on button "Delete"
      Then verify text "The IMSI range was successfully deleted!"
      Then logout





    @TC_SIM_PRVSNG_DELETE_IMSI_RANGE
    #This test case is passed
     Scenario: Delete IMSI Range - Platform Admin
       Given test case starts
       Given browser is open
       Then login
       When click on link "PPVGE as Operator Administrator"
       When click on link "Platform as Platform Administrator"
       When click on menu "Administration"
       When click on submenu "IMSI ranges"
       Then verify text "Results"
       Then enter "Next available IMSI" "USE_IMSIRange_NextAvailableIMSI"
       When click on button "Search"
       Then verify text "USE_IMSIRange_NextAvailableIMSI"
       When click on link "USE_IMSIRange_NextAvailableIMSI"
       When click on button "Delete range"
       Then verify text "Confirmation"
       When click on button "Delete"
       Then verify text "The IMSI range was successfully deleted!"
       When click on link "Platform as Platform Administrator"
       When click on link "PPVGE as Operator Administrator"
       Then verify text "Updated on"
       Then logout
