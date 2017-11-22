@SIM_State_Operation
Feature: SIM State Change
###Pre-requisite IMSI State is in Inactive State
###Premiun States Customer should be enabled

  @REG_R10_GUI_SIM_State_X_002
  Scenario: Test to verify the sim state change transformation from INACTIVE to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_A_001
  Scenario: Test to verify the sim state change transformation from  ACTIVE LIVE to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Live" to "Inactive"
      Then logout

  @REG_R10_GUI_SIM_State_X_001
  Scenario: Test to verify the sim state change transformation from  INACTIVE to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_D_002
  Scenario: Test to verify the sim state change transformation from  INACTIVE STOPPED to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive.Stopped" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_A_002
  Scenario: Test to verify the sim state change transformation from  ACTIVE LIVE to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Live" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_D_004
  Scenario: Test to verify the sim state change transformation from  INACTIVE STOPPED to ACTIVE STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive.Stopped" to "Active.Standby"
      Then logout

  @REG_R10_GUI_SIM_State_U_003
  Scenario: Test to verify the sim state change transformation from  Active.Standby to ACTIVE.LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Standby" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_A_003
  Scenario: Test to verify the sim state change transformation from  ACTIVE.LIVE to ACTIVE.STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Live" to "Active.Standby"
      Then logout

  @REG_R10_GUI_SIM_State_U_001
  Scenario: Test to verify the sim state change transformation from  ACTIVE STANDBY to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Standby" to "Inactive"
      Then logout

  @REG_R10_GUI_SIM_State_X_004
  Scenario: Test to verify the sim state change transformation from  INACTIVE to ACTIVE STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive" to "Active.Standby"
      Then change sim "USE_Customer1_MSISDN1" from "Active.Standby" to "Inactive"
      Then logout

  @REG_R10_GUI_SIM_State_X_005
  Scenario: Test to verify the sim state change transformation from INACTIVE to ACTIVE SUSPEND.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive" to "Active.Suspend"
      Then logout

  @REG_R10_GUI_SIM_State_S_003
  Scenario: Test to verify the sim state change transformation from SUSPEND to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Suspend" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_A_004
  Scenario: Test to verify the sim state change transformation from ACTIVE LIVE to ACTIVE SUSPEND.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Live" to "Active.Suspend"
      Then logout

  @REG_R10_GUI_SIM_State_S_002
  Scenario: Test to verify the sim state change transformation from SUSPEND to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Suspend" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_D_005
  Scenario: Test to verify the sim state change transformation from INACTIVE STOPPED to ACTIVE SUSPEND.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive.Stopped" to "Active.Suspend"
      Then logout

  @REG_R10_GUI_SIM_State_S_001
  Scenario: Test to verify the sim state change transformation from  ACTIVE SUSPEND to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Active.Suspend" to "Inactive"
      Then logout

  @REG_R10_GUI_SIM_State_D_001
  Scenario: Test to verify the sim state change transformation from INACTIVE STOPPED to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN1" from "Inactive" to "Inactive.Stopped"
      Then change sim "USE_Customer1_MSISDN1" from "Inactive.Stopped" to "Inactive"
      Then logout

    ####Pre-requisite: 1. SIM should be in Active.Sleep State
    #####              2. Three SIMs are required in Active.Sleep

  @REG_R10_GUI_SIM_State_C_001
  Scenario: Test to verify the sim state change transformation from ACTIVE SLEEP to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Sleep" to "Inactive.Stopped"
      Then logout

@REG_R10_GUI_SIM_State_C_002
  Scenario: Test to verify the sim state change transformation from ACTIVE SLEEP to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Sleep" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_C_004
  Scenario: Test to verify the sim state change transformation from ACTIVE SLEEP to ACTIVE STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Sleep" to "Active.Standby"
      Then logout

   ### Pre-requisite: 1. New SIM required.
   ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live
   @REG_R10_GUI_SIM_State_T_003
  Scenario: Test to verify the sim state change transformation from ACTIVE TEST to ACTIVE READY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Test" to "Active.Ready"
      Then logout

  @REG_R10_GUI_SIM_State_R_003
  Scenario: Test to verify the sim state change transformation from ACTIVE READY to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Ready" to "Active.Live"
      Then logout

   ### Pre-requisite: 1. New SIM required.
   ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live

  @REG_R10_GUI_SIM_State_X_003
  Scenario: Test to verify the sim state change transformation from INACTIVE to ACTIVE READY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Inactive" to "Active.Ready"
      Then logout

  @REG_R10_GUI_SIM_State_R_001
  Scenario: Test to verify the sim state change transformation from ACTIVE READY to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Ready" to "Inactive"
      Then logout

  ### Pre-requisite: 1. New SIM required.
  ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live

  @REG_R10_GUI_SIM_State_S_004
  Scenario: Test to verify the sim state change transformation from SUSPEND to ACTIVE READY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Suspend" to "Active.Ready"
      Then logout

  @REG_R10_GUI_SIM_State_R_004
  Scenario: Test to verify the sim state change transformation from READY to ACTIVE SUSPEND.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Ready" to "Active.Suspend"
      Then logout

  ### Pre-requisite: 1. New SIM required.
  ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live

  @REG_R10_GUI_SIM_State_S_007
  Scenario: Test to verify the sim state change transformation from SUSPEND to ACTIVE TEST.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Suspend" to "Active.Test"
      Then logout

  @REG_R10_GUI_SIM_State_T_004
  Scenario: Test to verify the sim state change transformation from TEST to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Test" to "Active.Live"
      Then logout

   ### Pre-requisite: 1. New SIM required.
  ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live

  @REG_R10_GUI_SIM_State_U_005
  Scenario: Test to verify the sim state change transformation from ACTIVE STANDBY to ACTIVE TEST.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Standby" to "Active.Test"
      Then logout

 @REG_R10_GUI_SIM_State_T_006
  Scenario: Test to verify the sim state change transformation from TEST to INACTIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Test" to "Inactive"
      Then logout

  ### Pre-requisite: 1. 4 New SIM required.
  ###                2. SIM should never been to Active.Ready or Active.Test or Active.Live

  @REG_R10_GUI_SIM_State_T_005
  Scenario: Test to verify the sim state change transformation from TEST to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Test" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_T_002
  Scenario: Test to verify the sim state change transformation from  ACTIVE TEST to SUSPEND.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Test" to "Active.Suspend"
      Then logout

  @REG_R10_GUI_SIM_State_R_002
  Scenario: Test to verify the sim state change transformation from READY to INACTIVE.STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Ready" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_R_005
  Scenario: Test to verify the sim state change transformation from READY to ACTIVE STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Active.Ready" to "Active.Standby"
      Then logout

   ###SIM Transformation Dependency
  ####Pre-Requisites: SIM should be in Inactive.Transformed State.

  @REG_R10_GUI_SIM_State_V_001
  Scenario: Test to verify the sim state change transformation from INACTIVE TRANSFORMED to INACTIVE STOPPED.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Inactive.Transformed" to "Inactive.Stopped"
      Then logout

  @REG_R10_GUI_SIM_State_V_002
  Scenario: Test to verify the sim state change transformation from INACTIVE TRANSFORMED to ACTIVE LIVE.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Inactive.Transformed" to "Active.Live"
      Then logout

  @REG_R10_GUI_SIM_State_V_004
  Scenario: Test to verify the sim state change transformation from INACTIVE TRANSFORMED to ACTIVE STANDBY.
      Given test case starts
      Given browser is open
      Then login
      Then change sim "USE_Customer1_MSISDN" from "Inactive.Transformed" to "Active.Standby"
      Then logout

  @TC_REG_R10_GUI_SIMManagement_001Test_InactivetoActiveLive_Customer
  Scenario: Verify that Customer user can change state of one or multiple SIMs
        Given test case starts
        Given browser is open
        Then login
        When click on link "PPVGE as Operator Administrator"
        When click on link "AutomationCust1 as Customer Administrator"
        When click on menu "Devices"
        When click on menu "All devices"
        Then verify text "Results"
        Then enter textarea "IMSI" "USE_Customer1_IMSIRange"
        When click on button "Search"
        Then verify value of "State" is "Inactive" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI1|
        Then verify value of "State" is "Inactive" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI2|
        Then select all from table
        When click on link "Operations"
        When click on button "Next"
        Then select dropdown "* Action" "Change state"
        Then verify text "Batch operation"
        Then select dropdown "New State" "Active.Live"
        #Then select dropdown "State change reason" "End of contract"
        When click on button "Next"
        When click on button "Submit"
        Then verify text "The batch operation was successfully submitted"
        # validation1- from batch operations results checking the batch completion state
        When click on button "Go to devices"
        Then verify text "Devices"
        Then verify value of "State" is "Active.Live" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI1|
        Then verify value of "State" is "Active.Live" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI2|
        Then report "State change is successful"
        Then logout

  @TC_REG_R10_GUI_SIMManagement_002Test_InactivetoActiveLive_OPCOUser
  Scenario: Verify that Opco user can change state of one or multiple SIMs
        Given test case starts
        Given browser is open
        Then login
        #When click on link "PPVGE as Operator Administrator"
        When click on menu "Devices"
        When click on menu "All devices"
        Then verify text "Results"
        Then enter textarea "IMSI" "USE_Customer1_IMSIRange"
        When click on button "Search"
        Then verify value of "State" is "Inactive" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI1|
        Then verify value of "State" is "Inactive" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI2|
        Then select all from table
        When click on link "Operations"
        When click on button "Next"
        Then select dropdown "* Action" "Change state"
        Then verify text "Batch operation"
        Then select dropdown "New State" "Active.Live"
        #Then select dropdown "State change reason" "End of contract"
        When click on button "Next"
        When click on button "Submit"
        Then verify text "The batch operation was successfully submitted"
        # validation1- from batch operations results checking the batch completion state
        When click on button "Go to devices"
        Then verify text "Devices"
        Then verify value of "State" is "Active.Live" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI1|
        Then verify value of "State" is "Active.Live" of table based on below criteria
        |IMSI|
        |USE_Customer1_IMSI2|
        Then report "State change is successful"
        Then logout

  @REG_R10_GUI_SIMManagement_004
  Scenario: Test to verify that State Change reason is mandatory
      Given test case starts
      Given browser is open
      Then login
      When click on link "PPVGE as Operator Administrator"
      When click on link "AutomationCust1 as Customer Administrator"
      Then State change reason is mandatory "USE_Customer1_IMSI2" from "Inactive" to "Active.Live"
      Then logout

  @REG_R8.0_GUI_TestMode_001
  Scenario: Test to verify that whether Opco user can configure Test Mode for a Customer Service profile
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on menu "Service profiles"
      Then verify text "Service profiles"
      Then enter "Service Profile" "AutoCustCSP1"
      When click on button "Search"
      Then verify text "1 matching result(s)"
      When click on link "AutoCustCSP1"
      When click on link "Details"
      When click on button "Edit" on position 1
      Then select drop down "Post test mode state" "Active.Ready"
      When click on button "Save"
      Then verify text "Settings successfully updated"
      When click on button "Edit" on position 2
      Then verify below values and set to unlimited
      |LabelName|
      |Volume limit|
      |Expiration time limit|
      |Usage time limit     |
      |SMS wakeup limit     |
      |SMS payload limit    |
      |SMS MO limit         |
      |Voice usage          |
      When click on infinity button of "Volume limit"
      Then enter "Volume limit" "10"
      Then select dropdown "Volume limit" "Bytes"
      When click on infinity button of "Expiration time limit"
      Then enter "Expiration time limit" "90"
      Then select dropdown "Expiration time limit" "Weeks"
      When click on infinity button of "Usage time limit"
      Then enter "Usage time limit" "7"
      When click on infinity button of "SMS wakeup limit"
      Then enter "SMS wakeup limit" "10"
      When click on infinity button of "SMS payload limit"
      Then enter "SMS payload limit" "10"
      When click on infinity button of "SMS MO limit"
      Then enter "SMS MO limit" "10"
      When click on infinity button of "Voice usage"
      Then enter "Voice usage" "900"
      Then select dropdown "Voice usage" "Seconds"
      When click on button "Save"
      Then verify text "Settings successfully updated"
      Then report "Test Mode configuration is successful"
      Then logout



