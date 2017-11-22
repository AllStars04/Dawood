@MoveCSP
Feature: MoveCSP

@tc_GUI_MoveCSP_006
  Scenario: Test to verify that Opco User can Move the SIM from LBS-disabled CSP to LBS-enabled.

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIinCustomerwithLBSDisabled_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIinCustomerwithLBSDisabled_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       When click on input "* Organisation" "USE_ToLBSEnabledCustomer_NAME"
       Then select dropdown "* New service profile" "USE_ToLBSEnabledCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout


  @tc_GUI_MoveCSP_008
   Scenario: Test to verify that Opco User can Move the SIM from SMPP-disabled CSP to SMPP-enabled.

       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIinCustomerwithSMPPDisabled_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIinCustomerwithSMPPDisabled_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       When click on input "* Organisation" "USE_ToSMPPEnabledCustomer_NAME"
       Then select dropdown "* New service profile" "USE_ToSMPPEnabledCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout


  @tc_GUI_MoveCSP_010
   Scenario: Test to verify that Opco User can Move the SIM from SMS MO rating by serving OpCo disabled CSP to SMS MO rating by serving OpCo enabled


       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIinCustomerwithSMSMOratingDisabled_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIinCustomerwithSMSMOratingDisabled_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       When click on input "* Organisation" "USE_ToSMSMOratingEnabledCustomer_NAME"
       Then select dropdown "* New service profile" "USE_ToSMSMOratingEnabledCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout


 @tc_GUI_MoveCSP_003
   Scenario: Test to verify that Customer User can move the SIM to other service profile using GUI


       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIinCustomer_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIinCustomer_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       Then select dropdown "* New service profile" "USE_TootherCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout

   @tc_GUI_MoveCSP_004
   Scenario: Test to verify that OpCo user can move the SIM to different Service Profile with different SMS-MO Routin


       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIwithSMSMOrating_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIwithSMSMOrating_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       When click on input "* Organisation" "USE_TodifferentSMSMOratingEnabledCustomer_NAME"
       Then select dropdown "* New service profile" "USE_TodifferentSMSMOratingEnabledCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout


  @tc_GUI_MoveCSP_002
   Scenario: Test to verify that Opco User can move the SIM from Voice-disabled customer to Voice-enabled customer


       Given test case starts
       Given browser is open
       Then login
       When click on menu "Devices"
       When click on submenu "All devices"
       Then enter textarea "IMSI" "USE_IMSIinVoicedisabledcustomer_MSISDN"
       When click on button "Search"
       When click on link "USE_IMSIinVoicedisabledcustomer_MSISDN"
       Then verify text "Overview"
       When click on link "Operations"
       Then verify text "Take action"
       When click on link "Configure"
       When click on link "Change service profile"
       When click on input "* Organisation" "USE_Voiceenabledcustomer_NAME"
       Then select dropdown "* New service profile" "USE_VoiceenabledcustomerCSP_NAME"
       When click on button "Next"
       Then verify text "Confirmation"
       When click on button "Change"
       #Then verify text "Conclusion"
       #When click on button "Go to operations"
       Then logout
