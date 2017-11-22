@IMEIOperations
Feature: IMEI Operations/IMEI

  @tc_IMEI_001
  Scenario: Test to verify whether IMEI of the Device get detected automatically on First Ever Use

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIDetectedwithFirstEverUse_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIDetectedwithFirstEverUse_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_IMEI_002
  Scenario: Test to verify whether IMEI of the Device get detected automatically on First Active-Live Use

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIDetectedwithFirstActiveLiveUse_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIDetectedwithFirstActiveLiveUse_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_IMEI_003
  Scenario: Test to verify whether IMEI of the Device is not detected automatically when configured as set explicitly

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIDetectedwithExplicitly_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIDetectedwithExplicitly_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is not set"
       When click on link "Cancel"
       Then logout