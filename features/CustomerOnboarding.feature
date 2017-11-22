@CustomerOnboarding
Feature: Customer On Boarding
 This feature covers the functionality of onboarding customers to M2M portal

    @REG_R10_GUI_Customer_Onboarding_017
#      Failing at the point of selection of Move CSP
    Scenario: Test to verify that the Opco user can configure Move SIMs to Customer for a customer in the Global M2M Platform
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit" on position 3
      When click on link "Add customer"
      When click on input "* Customer" and enter value "USE_CustomerOnboarding_MoveSIMCustomer"
      Then enter "* Service profiles" "USE_CustomerOnboarding_MoveSIMcsp"
      When click on button "Save"
      | type  | value  |
      | text  | USE_CustomerOnboarding_MoveSIMCustomer|
      | text  | USE_Customeronboarding_MoveSIMcsp|
      Then logout

    @REG_R10_GUI_Customer_Onboarding_018
    Scenario: Test to verify the functionality to copy a customer
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      When click on link "Create organisation"
      When click on button "Create customer"
      Then verify text "* Customer name"
#      Below line of codes in not working as PPVGE is getting entered but no click
#      When click on input "* Parent organisation" and enter value "USE_CustomerOnboarding_ParentOrg"
      Then enter "* Customer name" "USE_CustomerOnboarding_NewCopyCustName"
      Then enter "* Customer description" "USE_CustomerOnboarding_CopyCustDes"
      Then select radiobutton "Yes"
#      Below line of codes in not working
#      When click on input "* Copy settings from" and enter value "USE_CustomerOnboarding_Customer"
      Then verify text "* Copy settings from"
      When click on button "Next"
      Then verify text "Data service"
      Then select radiobutton "Disabled" on position 8
      When click on button "Next"
      Then verify text "Reports"
      Then select radiobutton "Disabled" on position 1
      Then select radiobutton "Disabled" on position 2
      Then select dropdown "* Tariffs" "USE_CustomerOnboarding_Tariffs"
      When click on button "Next"
      Then verify text "forecasting"
      When click on button "Next"
      Then verify text "You're about to create the customer"
#      When click on button "Create"
      Then logout

    @REG_R10_GUI_Customer_Onboarding_025
    Scenario: Test to verify that the field SIM State Change Reason  appers while changing state only if it is enabled in customer configuration
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit" on position 1
      Then select dropdown "State change reason" "Mandatory"
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomerOnboarding_IMSI"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_IMSI"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Change state"
      Then verify text "State change reason"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit" on position 1
      Then select dropdown "State change reason" "Not requested"
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomerOnboarding_IMSI"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_IMSI"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Change state"
      #Then verify text "State change reason"
      Then logout

    @REG_R10_GUI_Customer_Onboarding_029
#      Success
    Scenario: Test to verify that sim state change to active-standby is possible only if it is enabled in customer configuration
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit" on position 1
      Then select radiobutton "Enabled" on position 1
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomerOnboarding_IMSI"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_IMSI"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Change state"
      Then select dropdown "* New state" "Active.Standby"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on button "Edit" on position 1
      Then select radiobutton "Disabled" on position 1
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_CustomerOnboarding_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_CustomerOnboarding_IMSI"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_IMSI"
      When click on tab "Operations"
      When click on link "Configure"
      When click on link "Change state"
      Then select dropdown "* New state" "Active.Standby"
      Then logout


    @REG_R10_GUI_Customer_Onboarding_031
#      Success
    Scenario: Test to verify that the button SMS Commands  appears on SIM detail page only if it is enabled in customer
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then verify text "per page"
      Then enter "Organisation" "USE_SMSCommand_Customer"
      When click on button "Search"
      When click on link "USE_SMSCommand_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Connectivity services"
      When click on button "Edit" on position 3
      Then select radiobutton "Enabled" on position 1
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_SMSCommand_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_SMSCommand_IMSI"
      When click on button "Search"
      When click on link "USE_SMSCommand_IMSI"
      When click on tab "Operations"
      Then verify text "Send Command"
      When click on link "USE_SMSCommand_CustomerUser"
      Then verify text "Administrator"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_SMSCommand_Customer"
      When click on button "Search"
      When click on link "USE_SMSCommand_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Connectivity services"
      When click on button "Edit" on position 3
      Then select radiobutton "Disabled" on position 1
      When click on button "Save"
      When click on link "USE_User_OperatorAdministratorRole"
      Then verify text "Administrator"
      When click on link "USE_SMSCommand_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_SMSCommand_IMSI"
      When click on button "Search"
      When click on link "USE_SMSCommand_IMSI"
      When click on tab "Operations"
      Then verify no text "Send Command"
      Then logout



  @REG_R10_GUI_Customer_Onboarding_026
#      Success
    Scenario: Test to verify that transactional SMS can be sent only if it is enabled in customer configuration
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then verify text "per page"
      Then enter "Organisation" "USE_SMSCommand_Customer"
      When click on button "Search"
      When click on link "USE_SMSCommand_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Connectivity services"
      When click on button "Edit" on position 3
      Then select radiobutton "Enabled" on position 3
      When click on button "Save"
      Then verify text "Transactional SMS"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_SMSCommand_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_SMSCommand_IMSI"
      When click on button "Search"
      When click on link "USE_SMSCommand_IMSI"
      When click on tab "Operations"
      When click on link "Send SMS"
      Then verify text "* Sender's Number"
      Then enten "* Sender's Number" "USE_SMSCommand_SenderNumber"
      Then select dropdown "* Type" "Transactional"
      Then enter textarea "Message" "USE_SMSCommand_TransactionalSMS"
      When click on button "Send"
      Then veify text "A reply to the transactional SMS from the device"
      When click on link "USE_SMSCommand_CustomerUser"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on menu "Administration"
      When click on submenu "Customers"
      Then enter "Organisation" "USE_SMSCommand_Customer"
      When click on button "Search"
      When click on link "USE_SMSCommand_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Connectivity services"
      When click on button "Edit" on position 3
      Then select radiobutton "Disabled" on position 3
      When click on button "Save"
      Then verify text "Transactional SMS"
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_SMSCommand_CustomerUser"
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_SMSCommand_IMSI"
      When click on button "Search"
      When click on link "USE_SMSCommand_IMSI"
      When click on tab "Operations"
      When click on link "Send SMS"
      Then verify text "* Sender's Number"
      Then enter textarea "* Sender's Number" "USE_SMSCommand_SenderNumber"
      Then verify no text "Transactional"
#      Then select dropdown "* Type" "Transactional"
      Then logout


  @REG_R10_GUI_Customer_Onboarding_032
    Scenario: Test to verify the validity of short codes in customer configuration

      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "Customers"
      Then verify text "per page"
      Then enter "Organisation" "USE_CustomerOnboarding_Customer"
      When click on button "Search"
      When click on link "USE_CustomerOnboarding_Customer"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Connectivity services"
      When click on button "Edit" on position 3
      Then select radiobutton "Yes" on position 1
      Then enter "* Sender's number" "USE_CustomerOnboarding_SMSShortCode<4"
      When click on button "Save"
      Then verify text "Please insert between 4 and 15 digits, or 3 and 14 digits ending with *"
      Then enter "* Sender's number" "USE_CustomerOnboarding_SMSShortCode>15"
      When click on button "Save"
      Then verify text "Please insert between 4 and 15 digits, or 3 and 14 digits ending with *"
      Then enter "* Sender's number" "USE_CustomerOnboarding_SMSShortCodeAlphabets"
      When click on button "Save"
      Then verify text "Please insert between 4 and 15 digits, or 3 and 14 digits ending with *"
      Then enter "* Sender's number" "USE_CustomerOnboarding_SMSShorCodeValid"
      When click on button "Save"
      When click on button "Save"
      Then verify text "Settings successfully updated"
      Then logout
































