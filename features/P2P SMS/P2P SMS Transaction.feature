@P2PSMSTransaction

Feature: P2P SMS Transaction

  @tc_MR_P2P_SMS_044
  Scenario: Test to verify the SMS MO sent from IOT SIM to Non-IOT SIM when Device level ACL configuration is allowed

       Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_ALDLMOMessage" from "USE_P2PSMSTransaction_ALDLMOIOT" to "USE_P2PSMSTransaction_ALDLMONonIOT"
       #     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALDLMOIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_ALDLMOIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |
       |Success |

       Then verify text "SMS MO"
       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_ALDLMOOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_ALDLMOOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALDLMOIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |

       Then verify text "USE_P2PSMSTransaction_ALDLMOMessage"
       Then logout


  @tc_MR_P2P_SMS_046
  Scenario: Test to verify the SMS MO sent from IOT SIM to Non-IOT SIM when CSP level ACL configuration is allowed


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_ALCSPMOMessage" from "USE_P2PSMSTransaction_ALCSPMOIOT" to "USE_P2PSMSTransaction_ALCSPMONonIOT"
#     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALCSPMOIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_ALCSPMOIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |
       |Success |

       Then verify text "SMS MO"
       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_ALCSPMOOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_ALCSPMOOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALCSPMOIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |

       Then verify text "USE_P2PSMSTransaction_ALCSPMOMessage"
       Then logout


  @tc_MR_P2P_SMS_048
  Scenario: Test to verify the SMS MT sent from Non-IOT SIM to IOT SIM when Device level ACL configuration is allowed


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_ALDLMTMessage" from "USE_P2PSMSTransaction_ALDLMTNonIOT" to "USE_P2PSMSTransaction_ALDLMTIOT"
      #     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALDLMTIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_ALDLMTIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Success |

       Then verify text "SMS MT"
       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_ALDLMTOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_ALDLMTOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALDLMTIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_ALDLMTMessage"
       Then logout


  @tc_MR_P2P_SMS_050
  Scenario: Test to verify the SMS MT sent from Non-IOT SIM to IOT SIM when CSP level ACL configuration is allowed


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_ALCSPMTMessage" from "USE_P2PSMSTransaction_ALCSPMTNonIOT" to "USE_P2PSMSTransaction_ALCSPMTIOT"
      #     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALCSPMTIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_ALCSPMTIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Success |

       Then verify text "SMS MT"
       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_ALCSPMTOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_ALCSPMTOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALCSPMTIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_ALCSPMTMessage"
       Then logout



  @tc_MR_P2P_SMS_055
  Scenario: Test to verify that P2P SMS MT is denied when P2P SMS service at CSP is None


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_ALnoneMTMessage" from "USE_P2PSMSTransaction_ALnoneMTNonIOT" to "USE_P2PSMSTransaction_ALnoneMTIOT"
       #     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALnoneMTIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_ALnoneMTIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Failed |

       Then verify text "Failure reason"
       Then verify text "USE_P2PSMSTransaction_ALnoneMTOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_ALnoneMTOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_ALnoneMTIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_ALnoneMTMessage"
       Then logout


  @tc_MR_P2P_SMS_056
  Scenario: Test to verify that P2P SMS MO is denied for the IOT SIM  when the P2P SMS Service at CSP is P2P SMS MT


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_CSPMTdenyMOMessage" from "USE_P2PSMSTransaction_CSPMTdenyMOIOT" to "USE_P2PSMSTransaction_CSPMTdenyMONonIOT"
#     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMTdenyMOIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_CSPMTdenyMOIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |
       |Failed |

       Then verify text "Failure reason"
       Then verify text "DeniedCSPMO"
       Then verify text "USE_P2PSMSTransaction_CSPMTdenyMOOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_CSPMTdenyMOOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMTdenyMOIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |

       Then verify text "USE_P2PSMSTransaction_CSPMTdenyMOMessage"
       Then logout


  @tc_MR_P2P_SMS_057
  Scenario: Test to verify that P2P SMS MT is denied for the IOT SIM  when the P2P SMS Service at CSP is P2P SMS MO


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_CSPMOdenyMTMessage" from "USE_P2PSMSTransaction_CSPMOdenyMTNonIOT" to "USE_P2PSMSTransaction_CSPMOdenyMTIOT"
      #     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOdenyMTIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_CSPMOdenyMTIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Failed |

       Then verify text "Failure reason"
       Then verify text "DeniedCSPMT"
       Then verify text "USE_P2PSMSTransaction_CSPMOdenyMTOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_CSPMOdenyMTOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOdenyMTIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_CSPMOdenyMTMessage"
       Then logout


  @tc_MR_P2P_SMS_058
  Scenario: Test to verify that both P2P SMS MO and MT are allowed for the IOT SIM when the P2P SMS Service at CSP is both P2P SMS MO and P2P SMS MT

#      MO

       Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_CSPMOMTallowMOMessage" from "USE_P2PSMSTransaction_CSPMOMTallowMOIOT" to "USE_P2PSMSTransaction_CSPMOMTallowMONonIOT"

#     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOMTallowMOIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_CSPMOMTallowMOIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |
       |Success |

       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_CSPMOMTallowMOOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_CSPMOMTallowMOOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOMTallowMOIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MO |

       Then verify text "USE_P2PSMSTransaction_CSPMOMTallowMOMessage"

#       MT


#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_CSPMOMTallowMTMessage" from "USE_P2PSMSTransaction_CSPMOMTallowMTNonIOT" to "USE_P2PSMSTransaction_CSPMOMTallowMTIOT"

#     Web part
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOMTallowMTIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_CSPMOMTallowMTIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Success |

       Then verify text "Success"
       Then verify text "USE_P2PSMSTransaction_CSPMOMTallowMTOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_CSPMOMTallowMTOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_CSPMOMTallowMTIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_CSPMOdenyMTMessage"
       Then logout



  @tc_MR_P2P_SMS_060
  Scenario: Test to verify that the P2P SMS gets expired if the device is not reachable


      Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_P2PSMSExpiredMessage" from "USE_P2PSMSTransaction_P2PSMSExpiredNonIOT" to "USE_P2PSMSTransaction_P2PSMSExpiredIOT"

#     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_P2PSMSExpiredIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_P2PSMSExpiredIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Failed |

       Then verify text "Failure reason"
       Then verify text "expired"
       Then verify text "USE_P2PSMSTransaction_P2PSMSExpiredOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_P2PSMSExpiredOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_P2PSMSExpiredIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_P2PSMSExpiredMessage"
       Then logout


  @tc_MR_P2P_SMS_061
  Scenario: Test to verify that P2P SMS gets delivered if the device is reachable withn the P2P SMS validity period

       Given test case starts
#       Mobile Part
       Given select mobile "mobile2"
       When launch mobile app "message"
       Then store time in "strtime"
       Then send sms "USE_P2PSMSTransaction_P2PSMSDeliveredMessage" from "USE_P2PSMSTransaction_P2PSMSDeliveredNonIOT" to "USE_P2PSMSTransaction_P2PSMSDeliveredIOT"

#     Web part
       Given browser is open
       Then login
#       When click on link "USE_OPCOADMIN_NAME"
#       When click on link "USE_CUSTADMIN2_NAME"
       When click on menu "Devices"
       When click on submenu "All devices"
       Then verify text "Results"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_P2PSMSDeliveredIMSI"
       When click on button "Search"
       When click on link "USE_P2PSMSTransaction_P2PSMSDeliveredIMSI"
       Then verify text "Overview"
       When click on link "History"
       Then verify text "Activity list"
       Then select radiobutton "Activity list"
       Then select dropdown "Type" "SMS"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |
       |Success |

       Then verify text "USE_P2PSMSTransaction_P2PSMSDeliveredOtherpartynumber"
       When click on menu "Devices"
       When click on submenu "SMS inbox"
       Then verify text "Results"
       When click on input "* Organisation" and enter value "USE_P2PSMSTransaction_P2PSMSDeliveredOrgName"
       Then enter textarea "IMSI" "USE_P2PSMSTransaction_P2PSMSDeliveredIMSI"
       When click on button "Search"
       Then verify text "Results"
       Then click on results based on below criteria
       |values|
       |strtime|
       |SMS MT |

       Then verify text "USE_P2PSMSTransaction_P2PSMSDeliveredMessage"
       Then logout