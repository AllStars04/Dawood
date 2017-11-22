@ConfigMoveSIMCustomer
Feature: ConfigMoveSIMCustomer

  @tc_GUI_ConfigCSPMove_001
  Scenario: Test to verify whether Opco User can configure move SIM to Customer

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_OPCOIMSICust1_MSISDN"
       When click on button "Search"
       When click on link "USE_OPCOIMSICust1_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       #When click on input "* Organisation" and enter value "USE_OPCOCust2_NAME"
       Then select dropdown "* New service profile" "USE_OPCOCust2CSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       Then verify text "Conclusion"
       When click on button "Go to operations"
       Then logout


  @tc_GUI_ConfigCSPMove_002
  Scenario: Test to verify whether Customer user can move SIM to another customer.



       Given test case starts
       Given browser is open
       Then login
       When click on link "USE_OPCOADMIN_NAME"
       When click on link "USE_CUSTADMIN_NAME"
       Then verify text "M2M Dashboard"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_CUSTIMSICust1_MSISDN"
       When click on button "Search"
       When click on link "USE_CUSTIMSICust1_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
        #When click on input "* Organisation" "USE_CUSTCust2_NAME"
       Then select dropdown "* New service profile" "USE_CUSTCust2CSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       Then verify text "Conclusion"
       When click on button "Go to operations"
       Then logout

