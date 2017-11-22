Feature: IMEI Operations/Match IMEI

@tc_Match_IMEI_003
Scenario: Test to verify whether the device gets Tear Down and IMEI Lock Device along with Event Action gets triggered when SIM is used in a device with IMEI other than the configured one in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITearDownandIMEILock_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITearDownandIMEILock_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is currently set to"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITearDownandIMEILock_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITearDownandIMEILock_MSISDN"
       Then verify text "Active.suspend"
       #Select available report
       Then logout

  @tc_Match_IMEI_001
  Scenario: Test to verify whether the device will Not Tear Down session and No Event Action gets triggered when SIM is used in a device with IMEI which is configured in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSINoTearDownandIMEILock_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSINoTearDownandIMEILock_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_Match_IMEI_002
  Scenario: Test to verify whether the device gets Tear Down and Event Action gets triggered when SIM is used in a device with IMEI other than the configured one in GDSP

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSITearDownandEventAction_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSITearDownandEventAction_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is currently set to"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout