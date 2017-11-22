@SMS
Feature: SMS Inbox
  @REG_R5.0_GUI_SMS-Configuration_005
  Scenario: verify that for the transactional SMS the category should be displayed as SMS-MT-Transaction under SMS Management tab for Customer user
    Given test case starts
    Given browser is open
    Then login
    When click on link "PPVGE as Operator Administrator"
    When click on link "ADI_Testing_Cust as Customer Administrator"
    When click on menu "Devices"
    When click on menu "SMS inbox"
    When click on link "SMS Transactional"
    Then verify
    | type  | value |
    | text  | IMSI  |
    | text  | Sent on |
    | text  | Type |
    | text  | Other party number |
    | text  | Result |
    | text  | Body   |
    Then verify text "Transactional"
    Then report "SMS fields are verified"
    Then logout

  @REG_R5.0_GUI_SMS-Configuration_012
  Scenario: Test to verify that Opco user can view SMS Communication detail
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on menu "SMS inbox"
    When click on input "Organisation" and enter value "USE_CustomerSMS_Cust1"
    When click on button "Search"
    Then verify text "Results"
    Then verify
    | type  | value |
    | link  | SMS Payload  |
    | link  | SMS MO       |
    Then report "SMS Communication is visible"
    Then logout

   @REG_R5.0_GUI_SMS-Configuration_013
  Scenario: verify that Opco User can view the SMS details that have been sent to and received from an M2M Device.
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on menu "SMS inbox"
    When click on input "Organisation" and enter value "USE_CustomerSMS_Cust1"
    When click on button "Search"
    Then verify text "Results"
    When click on link "SMS Payload"
    Then verify Text "Sent on"
    When click on link "SMS MO"
    Then verify Text "Received on"
    Then report "SMS MO and MT text verified"
    Then logout

  @REG_R5.0_GUI_SMS-Configuration_014
  Scenario: verify that Customer user can view the SMS that have been sent to and received from an M2M Device as a conversation
    Given test case starts
    Given browser is open
    Then login
    When click on link "PPVGE as Operator Administrator"
    When click on link "ADI_Testing_Cust as Customer Administrator"
    When click on menu "Devices"
    When click on menu "SMS inbox"
    When click on button "Search"
    Then verify text "Results"
    When click on link "SMS Payload"
    Then verify Text "Sent on"
    When click on link "SMS MO"
    Then verify Text "Received on"
    Then report "SMS MO and MT text verified"
    Then logout
                
  @REG_R6.0_GUI_SMS-Configuration_020
  Scenario: Test to verify that Customer user can view SMS Communication
    Given test case starts
    Given browser is open
    Then login
    When click on link "PPVGE as Operator Administrator"
    When click on link "ADI_Testing_Cust as Customer Administrator"
    When click on menu "Devices"
    When click on menu "SMS inbox"
    Then enter textarea "IMSI" "USE_CustomerSMS_IMSI"
    When click on button "Search"
    Then verify text "Results"
    Then verify
    | type  | value |
    | link  | SMS Payload  |
    | link  | SMS MO       |
    Then report "SMS Communication is visible"
    Then logout

  @REG_R5.0_GUI_SMS-Configuration_015
  Scenario: verify that for the transactional SMS the category should be displayed as SMS-MT-Transaction under SMS Management tab for Opco user
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on menu "SMS inbox"
    When click on input "Organisation" and enter value "USE_CustomerSMS_Cust1"
    When click on button "Search"
    When click on link "SMS Transactional"
    Then verify
    | type  | value |
    | text  | IMSI  |
    | text  | Sent on |
    | text  | Type |
    | text  | Other party number |
    | text  | Result |
    | text  | Body   |
    Then verify text "Transactional"
    Then report "SMS feilds are verified"
    Then logout