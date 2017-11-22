@TEST
Feature: Operator Group User

  @TC_1
  Scenario: Login - Make remember last user role persistent
    Given test case starts
    Given browser is open
    Then login
#    When click on menu "aabb"
#    When click on submenu "All devices"
#    Then verify text "Results"
##
#    When click on link "111110001000002"
#    Then verify text "Overview"
#    When click on tab "Details"
#    Then verify text "SIM"
##    Then click on button "Change..." on position 2
#    Then verify
#    | type  | value  |
#    | link  | Saurabh |
#    | link  | Connectivity services   |
#    | link  | Profiles and groups |
#    | link  | Contract |
#    | link  | Recent data usage |
#    Then verify any
#    | type  | value  |
#    | link  | Conn services   |
#    | link  | Profiles and groups |
#    | link  | Contract |
#    | link  | Recent data usage |
#    | link  | Mobility |



  #    Then click on header "lastcolumn"
#    When click on link "+America+"
#    Then verify text "Overview"
#    When click on tab "Details"
#    Then verify text "SIM state"
#    When click on button "Edit" on position 2
#    Then set the value of "Volume limit" infinity
#    When click on infinity button of "NB-IoT message limit"

#    Then get value of "Parent Organisation" of table based on below criteria and store in "strval"
#    |IMSI|Organisation|
#    |111110001000002|IITC_FORD|
#    Then click on "checkbox" of table based on below criteria
#    |IMSI|
#    |111110001000002|

#    Then select all from table
#    When click on link "USE_Customer1_Status"
#    When click on link "Search"
#    When click on button "Create customer"
#    Then verify text "Basic information"
#    Then enter "Name" "AutoTest1"
#    Then enter "Description" "Code test"
#    When click on input "Parent organisation" and enter value "PPTOMTOM"
#    Then select radiobutton "Yes"
##    Then select radiobutton "Yes" on position 2

  @TC_2
  Scenario: testing
    Given test case starts
    Given browser is open
    Then login
    When click on link "PPVGE as Operator Administrator"
    When click on link "AutomationCust1 as Customer Administrator"
    Then verify text "M2M Dashboard"
    When click on menu "Devices"
    #When click on submenu "SMS inbox"
    When click on submenu "All devices"
    Then verify text "Results"
    When click on link "204043258711182"
    Then verify text "Device Information"
    When click on link "Operations"
    Then verify text "Send SMS"
    When click on button "Send SMS"
    Then verify text "SMS details"
    When click on link "Advanced settings"
    Then click on priority "HIGH"
#    Then select radiobutton "Activity list"
#    Then select drop down "Type" "SMS"
#    When click on button "Search"
##    Then verify text "Date"
#    Then store time in "strtime"
#    Then click on results based on below criteria
#    |values|
#    |strtime|
#    |SMS Transactional |
#    |204043258711182   |


#    Then click on header "Trace Time"
#    Then click on "Trace Time" of table based on below criteria
#    |Network Protocol|IMSI|
#    |DIAMETER|204043258797897|
    #Then store time in "strtime"