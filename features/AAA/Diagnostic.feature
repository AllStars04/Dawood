@Diagnostics
Feature: Diagnostics
 This feature covers Diagnostics functionality.

  @REG_R10_GUI_APN_001
#    Success
    Scenario: Test to verify OpCo User can view all Global, OpCo and Customer specific APN on Manage APNs page.
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then select dropdown "Class" "Customer"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "APN" of table based on below criteria
      |Class|
      |Customer|
      Then verify text "Customer"
      When click on menu "Administration"
      When click on submenu "APNs"
      Then select dropdown "Class" "Global"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "APN" of table based on below criteria
      |Class|
      |Global|
      Then verify text "Global"
      When click on menu "Administration"
      When click on submenu "APNs"
      Then select dropdown "Class" "Operator/Reseller"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "APN" of table based on below criteria
      |Class|
      |Operator/Reseller|
      Then verify text "Operator/Reseller"
      Then logout

  @REG_R10_GUI_APN_004
#    Success
    Scenario: Test to verify OpCo User can view External Radius Servers details of an APN on Manage APNs page.
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APNExtRad"
      When click on button "Search"
      When click on link "USE_Diagnostics_APNExtRad"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "RADIUS"
      Then verify text "Server IP address"
      Then verify text "RADIUS secret"
      Then verify text "UDP port"
      Then logout

  @REG_R10_GUI_APN_007
#    Success
    Scenario: Test to verify Customer User can view all Customer specific APN on Manage APNs page.
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_Diagnostics_OperatorAdministratorRole"
      When click on link "USE_Diagnostics_CustomerAdministratorRole"
      When click on menu "Administration"
      When click on submenu "My organisation"
      Then verify text "USE_Diagnostics_Customer"
      When click on tab "Details"
      When click on link "Connectivity services"
      Then verify text "Data service"
      Then verify no text "None"
      Then verify text "APN"
      Then logout


      @REG_R7.0_GUI_Diagnostic_Trace_001
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario: Test to verify that the OpCo User can start a Radius diagnostic trace for a particular SIM
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then click on "checkbox" of table based on below criteria
      | IMSI                   |
      | USE_Diagnostics_IMSI |
      When click on tab "Device_Tools"
      When click on button "Diagnostic trace"
      Then select dropdown "* Type" "Radius"
#      Then select dropdown "* Duration" "30 minutes"
      Then select dropdown "Extend by" "30 minutes"
      When click on button "Submit"
      Then verify text "The diagnostic trace was successfully submitted."
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
#      Web Part
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "Radius"
      When click on button "Search"
      Then verify text "Trace results"
      When click on button "Search"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
      Then logout

  @REG_R7.0_GUI_Diagnostic_Trace_003
#    Success
    Scenario: Test to verify that the OpCo User can start a SMS diagnostic trace for a particular SIM
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then click on "checkbox" of table based on below criteria
      | IMSI |
      | USE_Diagnostics_IMSI |
      When click on tab "Device_Tools"
      When click on button "Diagnostic trace"
      Then select dropdown "Type" "SMS"
#      Then select dropdown "Duration" "30 minutes"
      Then select dropdown "Extend by" "30 minutes"
      When click on button "Submit"
      Then verify text "The diagnostic trace was successfully submitted."
#      Mobile Part
      Given select mobile "mobile2"
      Then store time in "time1"
      When launch mobile app "message"
      Then send sms "Hello" from "USE_mobile2_deviceId1" to "USE_mobile2_RecMobNo"
#    Web Part
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "SMPP"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then verify text "Trace results"
      When click on button "Search"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      When click on button "Search"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |SMPP            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "SMPP"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
      Then logout

  @REG_R8.0_GUI_Diagnostic_Trace_005
#    Success
    Scenario: Test to verify that the OpCo User can start a Diameter trace for a particular SIM
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then click on "checkbox" of table based on below criteria
      | IMSI |
      | USE_Diagnostics_IMSI |
      When click on tab "Device_Tools"
      When click on button "Diagnostic trace"
      Then select dropdown "* Type" "Diameter"
#      Then select dropdown "* Duration" "30 minutes"
      Then select dropdown "* Extend by" "30 minutes"
      When click on button "Submit"
      Then verify text "The diagnostic trace was successfully submitted."
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
#    Web Part
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then verify text "Trace results"
      When click on button "Search"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
      Then logout


  @REG_R8.0_GUI_Diagnostic_Trace_007
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario: Test to verify that the OpCo User can start All trace for a particular SIM
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then click on "checkbox" of table based on below criteria
      | IMSI |
      | USE_Diagnostics_IMSI |
      When click on tab "Device_Tools"
      When click on button "Diagnostic trace"
      Then select dropdown "* Type" "All"
      Then select dropdown "Duration" "30 minutes"
#      Then select dropdown "* Extend by" "30 minutes"
      When click on button "Submit"
      Then verify text "The diagnostic trace was successfully submitted."
#    Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
      When launch mobile app "message"
      Then send sms "Hello M2M" from "USE_mobile2_deviceId1" to "USE_mobile2_RecMobNo"
      Then from "USE_mobile2_deviceId1" call No "USE_mobile2_RecMobNo"
#    Web Part
#    Diameter Trace
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "Diameter"
      When click on button "Search"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
#    SMPP Trace
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "SMPP"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |SMPP        |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "SMPP"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
#    Radius Trace
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "Radius"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS        |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
      Then logout


  @REG_R8.0_GUI_Diagnostic_Trace_011
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario: Test to verify that the OpCo User can configure SIM level All trace for multiple SIMs
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then enter textarea "IMSI" "USE_Diagnostics_MultipleSIMs"
      When click on button "Search"
      Then select all from table
      When click on tab "Device_Tools"
      When click on button "Diagnostic trace"
      Then select dropdown "* Type" "All"
      Then select dropdown "* Duration" "30 minutes"
#      Then select dropdown "Extend by" "30 minutes"
      When click on button "Submit"
      Then verify text "The diagnostic trace was successfully submitted."
#      Mobile Part -SIM1
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
      When launch mobile app "message"
      Then send sms "Hello M2M" from "USE_mobile2_deviceId1" to "USE_mobile2_RecMobNo"
      Then from "USE_mobile2_deviceId1" call No "USE_mobile2_RecMobNo"
#    Mobile Part -SIM2
      Given select mobile "mobile3"
      When launch mobile app "youtube"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
      When launch mobile app "message"
      Then send sms "Hello M2M" from "USE_mobile3_deviceId" to "USE_mobile3_RecMobNo"
      Then from "USE_mobile3_deviceId" call No "USE_mobile3_RecMobNo"
#      Web Part
#      Diameter Trace - SIM1
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "Diameter"
      When click on button "Search"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
#      Diameter Trace - SIM2
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      Then select dropdown "Network Protocol" "Diameter"
      When click on button "Search"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
#      SMPP Trace -SIM1
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "SMPP"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |SMPP        |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "SMPP"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
#    SMPP Trace -SIM2
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      Then select dropdown "Network Protocol" "SMPP"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |SMPP        |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "SMPP"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
#      Radius Trace -SIM1
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      Then select dropdown "Network Protocol" "Radius"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS        |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI"
#      Radius Trace -SIM2
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      Then select dropdown "Network Protocol" "Radius"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS        |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
      Then logout


  @REG_R8.0_GUI_Configure_Network_Trace_001
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario: Test to verify Opco User can perform Radius level tracing ON for a particular APN
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APN"
      When click on button "Search"
      When click on link "USE_Diagnostics_APN"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Tracing"
      Then verify text "Status"
      When click on button "Edit"
      Then select dropdown "Type" "Radius"
      Then select dropdown "Duration" "30 minutes"
      #      Then select dropdown "Extended by" "30 minutes"
      When click on button "Save"
      Then verify text "Expires on"
      Then store time in "time1"
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
#      Web Part
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Radius"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify no text "This step is just to add some wait"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS        |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
      Then logout


  @REG_R8.0_GUI_Configure_Network_Trace_003
#    Success
    Scenario: Test to verify Opco User can perform Diameter level tracing ON for a particular APN
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APN"
      When click on button "Search"
      When click on link "USE_Diagnostics_APN"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Tracing"
      Then verify text "Status"
      When click on button "Edit"
      Then select dropdown "Type" "Diameter"
      Then select dropdown "Duration" "30 minutes"
#      Then select dropdown "Extended by" "30 minutes"
      When click on button "Save"
      Then verify text "Expires on"
      Then store time in "time1"
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
#      Web Part
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER        |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
      Then logout


  @REG_R8.0_GUI_Configure_Network_Trace_005
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario:Test to verify Opco User can perform All level tracing ON for a paticular APN
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APN"
      When click on button "Search"
      When click on link "USE_Diagnostics_APN"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Tracing"
      Then verify text "Status"
      When click on button "Edit"
      Then select dropdown "Type" "All"
      Then select dropdown "Duration" "30 minutes"
#      Then select dropdown "Extended by" "30 minutes"
      When click on button "Save"
      Then verify text "Expires on"
      Then store time in "time1"
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
      Then from "USE_mobile2_deviceId" call No "USE_mobile2_RecMobNo"
#    Web Part
#      Diameter Trace Verification
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
#      Radius Trace Verification
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Radius"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS            |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
      Then logout


  @REG_R8.0_GUI_Configure_Network_Trace_006
#    Failing due to M2M defect as Radius trace are not getting updated on portal, Automation is done
    Scenario: Test to verify Opco User can extend All level tracing for a paticular APN
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APN"
      When click on button "Search"
      When click on link "USE_Diagnostics_APN"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Tracing"
      Then verify text "Status"
      When click on button "Edit"
      Then select dropdown "Type" "All"
#      Then select dropdown "Duration" "30 minutes"
      Then select dropdown "Extended by" "30 minutes"
      When click on button "Save"
      Then verify text "Expires on"
      Then store time in "time1"
#      Mobile Part
      Given select mobile "mobile2"
      When launch mobile app "youtube"
      Then store time in "time1"
      Then verify no text "No connection" on mobile
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"
      Then from "USE_mobile2_deviceId" call No "USE_mobile2_RecMobNo"
#    Web Part
#      Diameter Trace Verification
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify text "Results"
      Then verify text "Trace results"
      Then verify text "Results"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "DIAMETER"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
#      Radius Trace Verification
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Radius"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify no text "No results were found"
      When click on button "Search"
      Then click on header "Trace Time"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |RADIUS            |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "RADIUS"
      Then get value of "Trace time" and store in "time2"
      Then verify if "time2" "greater than or equal" "time1"
      Then verify text "USE_Diagnostics_IMSI2"
      When click on menu "Administration"
      When click on submenu "APNs"
      Then verify text "Results"
      Then enter "APN" "USE_Diagnostics_APN"
      When click on button "Search"
      When click on link "USE_Diagnostics_APN"
      Then verify text "Overview"
      When click on tab "Details"
      When click on link "Tracing"
      When click on button "Stop"
      Then verify text "Inactive"
      Then logout


  @REG_R10_GUI_Transactions_007
#    Success
    Scenario: Test to verify OpCo User can view Transaction Details on Transaction over view page.
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "API transactions"
      Then verify text "API transactions"
      Then verify text "Results"
      Then validate table row count "10"
      Then select dropdown "Show" "20"
      Then validate table row count "20"
      Then verify text "per page"
      Then logout


  @REG_R5.0_GUI_Transactions_001
#    Verification of CSV file content is pending
    Scenario: Test to verify OpCo User to extract transactions that have occurred on the M2M platform
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "API transactions"
      Then verify text "API transactions"
      Then verify no text "No results were found"
      Then verify text "Date"
      Then verify text "Operation"
      Then verify text "Result code"
      Then verify text "Organisation"
#      Then verify text "Entity key"
#      Then verify text "Entity type"
#      Then verify text "Entity ID"
#      |Type|Value|
#      |text|Date |
#      |text|Operation|
#      |text|Result code|
#      |text|Organisation|
#      |text|Entity key|
#      |text|Entity type|
#      |text|Entity ID|
      When click on link "Export"
      When click on button "CSV"



  @REG_R6.0_GUI_Transactions_002
#    Single API selection is happening but no further action..Failed
    Scenario: Test to verify OpCo User to view transaction volumes in a graphical way for single API and Multiple API
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "API charts"
      Then verify text "* Organisation"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts1"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts2"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts3"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts4"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts5"
      Then select dropdown "Period" "USE_Diagnostics_APIChartsPeriod"
      Then enter date "between" "USE_Diagnostics_RangeBetween"
      Then enter date "and" "USE_Diagnostics_RangeAnd"
      When click on button "Generate"
      Then verify text "API charts"
      Then verify no text "For the selected period there was zero usage."
      When click on menu "Tools"
      When click on submenu "API charts"
      Then verify text "* Organisation"
      Then enter date "between" "USE_Diagnostics_RangeBetween"
      Then enter date "and" "USE_Diagnostics_RangeAnd"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts4"
      Then verify text "API charts"
      When click on button "Generate"
      Then verify no text "For the selected period there was zero usage."
      Then logout


  @REG_R8.0_GUI_Transactions_006
#    Single API selection is happening but no further action..Failed
    Scenario: Test to verify Reseller User can view details of Single API Transaction volumes in Graphical view
      Given test case starts
      Given browser is open
      Then login
      When click on link "USE_User_OperatorAdministratorRole"
      When click on link "USE_User_ResellerAdministratorRole"
      When click on menu "Tools"
      When click on submenu "API charts"
      Then verify text "* Organisation"
      Then select dropdown "* API" "USE_Diagnostics_API4Charts4"
      Then enter date "between" "USE_Diagnostics_RangeBetween"
      Then enter date "and" "USE_Diagnostics_RangeAnd"
      When click on button "Generate"
      Then verify no text "For the selected period there was zero usage."
      Then logout


  @REG_R5.0_GUI_View_Trace_001
#    Success
    Scenario:  Test to verify OpCo User to view information about packet network trace files
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN3"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "Trace details"
      Then verify text "Source IP"
      Then verify text "Source port"
      Then verify text "Destination IP"
      Then verify text "Destination port"
      Then verify text "Reporting Host"
      Then verify text "USE_Diagnostics_IMSI"
      Then verify text "USE_Diagnostics_IMSImsisdn"
      Then verify text "USE_Diagnostics_APN3"
      Then logout



  @REG_R5.0_GUI_View_Trace_002
#    Success
    Scenario: Test to verify OpCo User to view an OpCos network trace configuration
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN3"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER            |USE_Diagnostics_IMSI|
      Then verify text "Information"
      Then verify text "Trace details"
      Then verify text "Source IP"
      Then verify text "Source port"
      Then verify text "Destination IP"
      Then verify text "Destination port"
      Then verify text "Reporting Host"
      Then verify text "USE_Diagnostics_IMSI"
      Then verify text "USE_Diagnostics_IMSImsisdn"
      Then verify text "USE_Diagnostics_APN3"
      Then logout


  @REG_R5.0_GUI_View_Trace_004
#    Success
    Scenario: Test to verify OpCo User can view payload of Traces on Packet Traces page.
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then select dropdown "Network Protocol" "Diameter"
      Then select dropdown "APN" "USE_Diagnostics_APN"
      Then enter textarea "IMSI" "USE_Diagnostics_IMSI2"
      When click on button "Search"
      Then verify no text "No results were found"
      Then click on "Trace Results" of table based on below criteria
      |Network Protocol|IMSI|
      |DIAMETER        |USE_Diagnostics_IMSI2|
      Then verify text "Information"
      Then verify text "Payload details"
      Then verify text "HEX"
      Then verify text "ASCII"
      Then logout


  @REG_R5.0_GUI_View_Trace_005
#    Success
    Scenario: Test to verify that Traces can be searched by Filter by APN search option
      Given test case starts
      Given browser is open
      Then login
      When click on menu "Tools"
      When click on submenu "Trace results"
      Then verify text "Results"
      Then enter date "Between" "USE_Diagnostics_RangeBetween1"
      Then enter date "And" "USE_Diagnostics_RangeAnd1"
      Then select dropdown "APN" "USE_Diagnostics_APN2"
      When click on button "Search"
      Then verify no text "No results were found"
      Then logout





















