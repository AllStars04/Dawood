@SIM_Registration
Feature: SIM Registration
  This feature covers SIM registration functionality.

  #Success#Configured
  @TC_SIMRegistration_View_SIM_Register_INFO_Customer
  Scenario:  View SIM Registeration Information- Customer
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
    When click on tab "Details"
    When click on link "Mobility"
    Then verify text "Status"
    Then logout

  #Teardown button not available
  @REG_R10_Registration_Data_005
  Scenario:  Teardown SIM Customer
    Given test case starts
    Given browser is open
    Given select mobile "mobile3"
    When launch mobile app "youtube"
    Then verify text "Home" on mobile
    Then click on home button
    #Then verify no text "Home" on mobile
    Then login
    When click on link "USE_User_OperatorAdministratorRole"
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "USE_PSUsageIMSI_TextAreaName" "USE_PSUsageIMSI_IMSINo"
    When click on button "Search"
    When click on link "USE_PSUsageIMSI_IMSINo"
    When click on tab "Operations"
    Then verify text "Send SMS"
    When click on button "Stop data session"
    Then verify text "You are about to stop all on-going data sessions"
    When click on button "Stop"
    #Then verify text "A Stop data session request has been submitted for Device"
    When launch mobile app "youtube"
    Then verify no text "Home" on mobile
    Then click on home button
    When click on link "USE_PSUsageUser_CustomerAdministratorRole"
    When click on link "USE_User_OperatorAdministratorRole"
    Then logout


  #Success#Configured
  @TC_SIMRegistration_Disable_teardown_Option_for_Customer
  Scenario:  Disable teardown Option for Customer OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Administration"
    When click on submenu "Customers"
    Then verify text "Results"
    Then enter "Organisation" "USE_DisableTeardown_Organisation"
    When click on button "Search"
    When click on link "USE_DisableTeardown_Organisation"
    Then verify text "Overview"
    When click on tab "Details"
    Then verify text "Devices"
    When click on link "Connectivity services"
    Then verify text "Data service"
    When click on button "Edit" on position 3
    Then select radiobutton "Disabled" on position 3
    When click on button "Save"
    Then logout


   @TC_SIMRegistration_teardown_SIM_Customer1
   #This test case is passed
   Scenario:  Teardown SIM Customer
    Given test case starts
    Given browser is open
    Then login
    When click on link "PPVGE as Operator Administrator"
    When click on link "ADI_Testing_Cust as Customer Administrator"
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "IMSI" "204043258711178"
    When click on button "Search"
    When click on link "204043258711178"
    When click on tab "Operations"
    Then verify text "Teardown"
    When click on button "Teardown"
    Then verify text "You're about to teardown all ongoing data sessions for Device"
    When click on button "Teardown"
    Then verify text "A Teardown request has been submitted for Device"
    Then logout