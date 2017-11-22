@SIMHistory
Feature: SIM Management
This feature covers complete SIM management functionality.

    @SIMHistory_View_SIM_History_OPCO
    #This test case is passed
    Scenario: View SIM history - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change state"
      Then verify text "Change service profile"
      Then verify text "Set home country"
      Then verify text "Set IMEI"
      Then verify text "New SIM record"
      Then logout

    @SIMHistory_View_SIM_State_change_values_History_OPCO
    #This test case is passed
    Scenario: View SIM state change values history - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change state"
      When click on expand link "Change state"
      Then verify text "Previous state"
      Then verify text "New state"
      Then verify text "Event date"
      Then logout

    @SIMHistory_View_SIM_Customer_change_values_History_OPCO
    #This test case is passed
    Scenario: View SIM state change values history - OPCO User
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change service profile"
      When click on expand link "Change service profile"
      Then verify text "Previous customer"
      Then verify text "New customer"
      Then verify text "Event date"
      Then logout


    @SIMHistory_View_SIM_History_Customer
    #This test case is passed
    Scenario: View SIM history - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_CustomerAdministratorRole"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change state"
      Then verify text "Change service profile"
      Then verify text "Set home country"
      Then verify text "Set IMEI"
      Then verify text "New SIM record"
      Then logout



    @SIMHistory_View_SIM_History_Country_change_Customer
    #This test case is passed
    Scenario: View SIM history country change values - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_CustomerAdministratorRole"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Set home country"
      When click on expand link "Set home country"
      Then verify text "Event date"
      Then logout


    @SIMHistory_View_SIM_History_IMEI_change_Customer
    #This test case is passed
    Scenario: View SIM history IMEI change values - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_CustomerAdministratorRole"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Set IMEI"
      When click on expand link "Set IMEI"
      Then verify text "New IMEI"
      Then verify text "Previous IMEI"
      Then logout

    @SIMHistory_View_SIM_History_CSP_change_Customer
    #This test case is passed
    Scenario: View SIM history CSP change values - Customer User
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_CustomerAdministratorRole"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_SIMHistory_IMSI"
      When click on button "Search"
      When click on link "USE_SIMHistory_IMSI"
      Then verify text "Overview"
      When click on tab "History"
      Then select radiobutton "Activity list"
      Then select dropdown "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change service profile"
      When click on expand link "Change service profile"
      Then verify text "New service profile"
      Then verify text "Previous service profile"
      Then logout
