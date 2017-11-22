@SIM_Operations
Feature: SIM Operations
 # This feature covers SIM operations functionality.

  #Success
  @TC_SIMOperations_SIM_Search_All_Options
  Scenario:  Search SIM with All options - Customer User
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select dropdown "State" "Inactive"
    When click on button "Search"
    Then verify text "Inactive"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_IMSI_TextAreaName" "USE_IMSI_IMSINo"
    When click on button "Search"
    Then verify
    | type  | value  |
    | link  | USE_IMSI_IMSINo   |
    When click on link "USE_User_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

  #Success#Configured
  @TC_SIMOperations_SIM_Search_WildCard
  Scenario:  Search SIM with Wild Card - OPCO User
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_IMSIWildCard_TextAreaName" "USE_IMSIWildCard_IMSINo"
    When click on button "Search"
    Then verify text "matching result(s)"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_ICCIDWildCard_TextAreaName" "USE_ICCIDWildCard_ICCIDNo"
    When click on button "Search"
    Then verify text "matching result(s)"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter "USE_IMEIWildCard_TextName" "USE_IMEIWildCard_IMEINo"
    When click on button "Search"
    Then verify text "matching result(s)"
    Then logout

  #Success#Configured
  @TC_SIMOperations_SIM_Search_Export
  Scenario:  Search SIM and export - OPCO User
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select all from table
    When click on link "Export"
    When click on button "CSV"
    Then logout

  #Success#Configured
  @TC_SIMOperations_SIM_Search_Export_CUST
  Scenario:  Search SIM and export - Customer User
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select all from table
    When click on link "Export"
    When click on button "CSV"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout


  #Success#Configured
  @TC_SIMOperations_FILTER_SIM_Search_Export_CUST
  Scenario:  Filter Search SIM and export - Customer User
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select dropdown "State" "Inactive"
    When click on button "Search"
    Then select all from table
    When click on link "Export"
    When click on button "CSV"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout


    #Success#Configured
  @TC_SIMOperations_FILTER_SIM_Search_CUST
  Scenario:  Filter Search SIM and export - Customer User
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select dropdown "State" "Inactive"
    When click on button "Search"
    Then select all from table
    When click on link "Export"
    When click on button "CSV"
    When click on link "USE_User_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

  #Success#Configured
  @TC_SIMOperations_FILTER_SIM_Search_Export_OPCO
  Scenario:  Filter Search SIM and export - OPCO User
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then select dropdown "State" "Inactive"
    When click on button "Search"
    Then select all from table
    When click on link "Export"
    When click on button "CSV"
    Then logout


  @TC_SIMOperations_View_Radius_Event
  Scenario:  View Radius Events details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "IMSI" "USE_C_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Radius events"
    Then enterDate "Activities between" "USE_Diagnostics_RangeBetween"
    Then enterDate "and" "USE_Diagnostics_RangeAnd"
    When click on button "Search"
    Then verify text "Success"
    When click on link "Success"
    Then verify text "Event date"
    Then verify text "Status"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout


  #Success
  @REG_R10_GUI_CS_Usage_001
  Scenario:  View CS Usage details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "IMSI" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Voice calls"
    When click on button "Search"
    Then verify text "Start"
    When click on link "Start"
    Then verify text "Start"
    Then verify text "End"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

    #Success
  @TC_SIMOperations_View_CS_Usage_Gui
  Scenario:  View CS Usage details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "IMSI" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Voice calls"
    When click on button "Search"
    Then verify text "Start"
    When click on link "Start"
    Then verify text "Start"
    Then verify text "End"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout


  #Success#Configured
  @TC_SIMOperations_View_PS_Usage
  Scenario:  View PS Usage details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Data sessions"
    When click on button "Search"
    Then verify text "Start"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout


    #Success#Configured
  @TC_SIMOperations_View_PS_Usage_OPCO
  Scenario:  View PS Usage details - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Data sessions"
    When click on button "Search"
    Then verify text "Start"
    Then logout


  #Success#Configured
  @TC_SIMOperations_View_SMS_Usage
  Scenario:  View SMS Usage details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "SMS"
    When click on button "Search"
    Then verify text "Date"
    When click on expand link "Date"
    Then verify text "Event date"
    Then verify text "Report Date"
    Then verify text "Type"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

  #Success#Configured
  @TC_SIMOperations_View_Multi_PS_Data_Session_Details
  Scenario:  View PS date multiple session details - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Data sessions"
    When click on button "Search"
    Then verify text "Start"
    When click on expand link "Start"
    Then verify text "Start"
    Then verify text "End"
    Then verify text "APN"
    When click on expand link "Start" on position 2
    Then verify text "Uploaded"
    Then verify text "Downloaded"
    Then verify text "Service Profile"
    Then logout

  #Success#Configured
  @TC_SIMOperations_View_APN_Details_SIM
  Scenario:  View APN details of a SIM- OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "Details"
    When click on link "Connectivity services"
    Then verify text "APN"
    Then logout

  #Success
  @TC_SIMOperations_View_CS_Usage_OPCO
  Scenario:  View CS Usage details - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Voice calls"
    When click on button "Search"
    Then verify text "Start"
    When click on link "Start"
    Then verify text "Start"
    Then verify text "End"
    Then logout

  #Success#Configured
  @TC_SIMOperations_View_Multi_PS_Data_Session_Details_Customer
  Scenario:  View PS date multiple session details - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "History"
    Then select radiobutton "Activity list"
    Then select dropdown "Type" "Data sessions"
    When click on button "Search"
    Then verify text "Start"
    When click on expand link "Start"
    Then verify text "Start"
    Then verify text "End"
    Then verify text "APN"
    When click on expand link "Start" on position 2
    Then verify text "Service Profile"
    Then verify text "Uploaded"
    Then verify text "Downloaded"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

  #Success#Configured
  @TC_SIMOperations_Update_APN_Credentials_SIM_Customer
  Scenario:  Update APN Credentials for SIM - Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "Operations"
    When click on link "Configure"
    When click on link "Set APN username and password"
    Then select dropdown "* APN" "USE_APNDropdown_DropdownValue"
    Then enter "* Username" "USE_APNCredentials_Username"
    Then enter "* Password" "USE_APNCredentials_Password"
    When click on button "Next"
    Then verify text "Please confirm the following data."
    When click on button "Confirm"
    Then verify text "APN have been set."
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then verify text "Updated on"
    Then logout

  #Success#Configured
  @TC_SIMOperations_Update_APN_Credentials_SIM_OPCO
  Scenario:  Update APN Credentials for SIM - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then verify text "Results"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    Then verify text "Overview"
    When click on tab "Operations"
    When click on link "Configure"
    When click on link "Set APN username and password"
    Then select dropdown "* APN" "USE_APNDropdown_DropdownValue"
    Then enter "* Username" "USE_APNCredentials_Username"
    Then enter "* Password" "USE_APNCredentials_Password"
    When click on button "Next"
    Then verify text "You are about to set"
    When click on button "Confirm"
    Then verify text "APN have been set."
    Then logout
