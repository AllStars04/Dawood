@P2PDiagnostic

Feature: P2P Diagnostic

  @tc_MR_P2P_SMS_043
  Scenario: Test to verify that the  P2P SMS traces are captured and displayed successfully for an IMSI within its configured expiry time.

    Given test case starts
    Given browser is open
    Then login
    When click on menu "Devices"
    When click on submenu "All devices"
    Then enter textarea "IMSI" "USE_P2PDiagnostic_IMSI"
    When click on button "Search"
    Then click on "checkbox" of table based on below criteria
      | IMSI                   |
      | USE_P2PDiagnostic_IMSI |
    When click on tab "Device_Tools"
    When click on button "Diagnostic trace"
    Then select dropdown "Type" "SMS"
    Then verify text "Duration"
#    Then verify text "Extend"
    Then select dropdown "Duration" "30 minutes"
#    Then select dropdown "Extend by" "30 minutes"
    When click on button "Submit"
    Then verify text "The diagnostic trace was successfully submitted."

#Mobile part
    Given select mobile "mobile2"
    When launch mobile app "message"
    Then store time in "time1"
    Then send sms "USE_P2PDiagnostic_Message" from "USE_P2PDiagnostic_IOTdevice" to "USE_P2PDiagnostic_NonIOTdevice"

#Web part

    When click on menu "Tools"
    When click on submenu "Trace results"
    Then verify text "Results"
    Then enter textarea "IMSI" "USE_P2PDiagnostic_IMSI"
    When click on button "Search"
    Then verify text "Trace results"
    When click on button "Search"
    Then verify text "Results"
    Then click on header "Trace Time"
    Then verify text "Results"
    Then verify text "Trace results"
    Then click on "Trace Results" of table based on below criteria
    |Network Protocol|IMSI|
    |SMPP            |USE_P2PDiagnostic_IMSI|
    Then verify text "Information"
    Then get value of "Trace time" and store in "time2"
    Then verify if "time2" "greater than or equal" "time1"
    Then verify text "USE_P2PDiagnostic_IMSI"
    Then logout



