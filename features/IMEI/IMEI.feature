@IMEITestCases
Feature: IMEI


  @tc_GUI_IMEI_006
  Scenario: Test to verify whether System identifies error when Opco User set Last Detected IMEI as the IMEI of the SIM when NO IMEI is already detected

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIwithnoIMEIDetected_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIwithnoIMEIDetected_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is not set"
       When click on link "Cancel"
       Then logout


  @tc_GUI_IMEI_001
  Scenario: Test to verify whether Opco User can update IMEI details of the SIM

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIUpdatewithnoIMEIDetected_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIUpdatewithnoIMEIDetected_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "The IMEI is not set"
       Then enter "IMEI" "USE_IMSIUpdatewithnewIMEI_MSISDN"
       When click on button "Next"
       Then verify text "USE_IMSIUpdatewithnewIMEI_MSISDN"
       When click on button "Confirm"
       Then logout

  @tc_GUI_IMEI_003
  Scenario: Test to verify whether the Last Detected IMEI gets update when IMEI Rule is set and PD Usage has been made

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIwithLastDetectedIMEI_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIwithLastDetectedIMEI_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Cancel"
       Then logout

  @tc_GUI_IMEI_005
  Scenario: Test to verify whether Opco User set Last Detected IMEI as the IMEI of the SIM

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSISetwithLastDetectedIMEI_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSISetwithLastDetectedIMEI_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Use"
       When click on button "Next"
       Then verify text "Please confirm"
       When click on button "Confirm"
       Then logout

  @tc_GUI_IMEI_004
  Scenario: Test to verify whether Customer User set Last Detected IMEI as the IMEI of the SIM

       Given test case starts
       Given browser is open
       Then login
       When click on link "USE_OPCOADMIN_NAME"
       When click on link "USE_CUSTADMIN1_NAME"
       Then verify text "M2M Dashboard"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSISetwithLastDetectedIMEI_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSISetwithLastDetectedIMEI_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Set IMEI"
       Then verify text "Last Detected IMEI"
       When click on link "Use"
       When click on button "Next"
       Then verify text "Please confirm"
       When click on button "Confirm"
       Then logout