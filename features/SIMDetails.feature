@SIMDetails
  Feature: SIM Management
  This feature covers complete SIM management functionality.

    @SIMDetails_View_SIM_Details
    #This test case is passed
    Scenario: View SIM details - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_PSUsageUser_CustomerAdministratorRole"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMDetails_IMSI"
      When click on button "Search"
      When click on link "USE_SIMDetails_IMSI"
      Then verify text "Overview"
      When click on tab "Details"
      Then verify text "SIM"
      Then verify text "Connectivity services"
      Then verify text "Profiles and groups"
      Then verify text "Contract"
      Then verify text "Recent data usage"
      Then verify text "Mobility"
      When click on link "Connectivity services"
      When click on link "Profiles and groups"
      When click on link "Contract"
      When click on link "Recent data usage"
      When click on link "Mobility"
      Then verify text "Status"
      Then logout



    @SIMDetails_View_SIM_Details_OPCO
    #This test case is passed
    Scenario: View SIM details - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMDetails_IMSI"
      When click on button "Search"
      When click on link "USE_SIMDetails_IMSI"
      Then verify text "Overview"
      When click on tab "Details"
      Then verify text "SIM"
      Then verify text "Connectivity services"
      Then verify text "Profiles and groups"
      Then verify text "Contract"
      Then verify text "Recent data usage"
      Then verify text "Mobility"
      When click on link "Connectivity services"
      When click on link "Profiles and groups"
      When click on link "Contract"
      When click on link "Recent data usage"
      When click on link "Mobility"
      Then verify text "Status"
      Then logout

    @SIMDetails_SET_COUNTRY
    #This test case is passed
    Scenario:  Set home country for SIM - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMDetails_IMSI"
      When click on button "Search"
      When click on link "USE_SIMDetails_IMSI"
      Then verify text "Overview"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Set Home Country"
      Then select dropdown "* New home country" "USE_SIMDetails_NewHomeCountry"
      When click on button "Set"
      Then verify text "was successfully set to"
      Then logout
