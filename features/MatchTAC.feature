@MatchTAC
Feature: IMEI Operations/Match TAC

@tc_Match_TAC_001
Scenario: Test to verify whether the device will Not Tear Down session and No Event Action gets triggered when SIM is used in a device with IMEI which is configured in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITACNoTearDownandEventAction_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITACNoTearDownandEventAction_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_Match_TAC_002
  Scenario: Test to verify whether the device gets Tear Down and Event Action gets triggered when SIM is used in a device with IMEI other than the configured one in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITACTearDownandEventAction_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITACTearDownandEventAction_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_Match_TAC_003
  Scenario: Test to verify whether the device gets Tear Down and IMEI Lock Device along with Event Action gets triggered when SIM is used in a device with IMEI other than the configured one in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITACTearDownandIMEILock_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITACTearDownandIMEILock_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is currently set to"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout