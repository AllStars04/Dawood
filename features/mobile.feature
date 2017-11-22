@MobileFeatures
Feature: Testing mobile actions

  @PlayVideo
  Scenario:Play a youtube video with the Given text
      Given test case starts
      Given select mobile "mobile3"
      When launch mobile app "youtube"
      Then verify text "Home" on mobile
      #Then verify no text "Home" on mobile
      #Given select mobile device "mobile2"
      #When launch mobile app "youtube"
      Then click on mobile icon "Search"
      Then tap on enter key on mobile
      Then enter "Search YouTube" "java" on mobile
      When click on mobile link "Java Programming"

  @SelectAPN
  Scenario: Selects an APN with the Given name
      Given test case starts
      #Given browser is open
      Given select mobile device "mobile2"
      #Then login
      #When click on menu "Devices"
      #When click on submenu "All devices"
     # Then verify text "Results"
      When launch mobile app "APNsettings"
      Then select mobile radiobutton "ppinternet.gdsp"


  @EditAPN
  Scenario: Edit the data of a Given APN
      Given test case starts
      Given select mobile device "mobile2"
      When launch mobile app "APNsettings"
      When click on mobile link "ppinternet.gdsp"
      


      #EditName
      When click on mobile link "Name"
      Then enter "Test" on mobile
      Then click on mobile button "OK"

      #EditUsername and password
      When click on mobile link "Username"
      Then enter "m2m" on mobile
      Then click on mobile button "OK"
      Then swipe up
      When click on mobile link "Password"
      Then enter "m2m" on mobile
      Then click on mobile button "OK"

      #Edit AuThentication type and APN protocol
      Then swipe up
      When click on mobile link "AuThentication type"
      Then tap mobile radio option "PAP"
      When click on mobile link "APN protocol"
      Then tap mobile radio option "IPv6"

      Then tap on hard right key on mobile
      Then click on text option "Save" on mobile
      Then click on mobile button "OK"

  @AddAPN
  Scenario: Add a new APN
      Given test case starts
      Given select mobile device "mobile2"
      When launch mobile app "APNsettings"
      Then tap on hard right key on mobile
      Then click on text option "New APN" on mobile

      #AddName
      When click on mobile link "Name"
      Then enter "Test1" on mobile
      Then click on mobile button "OK"
      When click on mobile link "APN"
      Then enter "test.apn.test" on mobile
      Then click on mobile button "OK"

      #Add Username and password
      When click on mobile link "Username"
      Then enter "m2m" on mobile
      Then click on mobile button "OK"
      Then swipe up
      When click on mobile link "Password"
      Then enter "m2m" on mobile
      Then click on mobile button "OK"

      #Add AuThentication type and APN protocol
      Then swipe up
      When click on mobile link "AuThentication type"
      Then tap mobile radio option "PAP"
      When click on mobile link "APN protocol"
      Then tap mobile radio option "IPv6"

      Then tap on hard right key on mobile
      Then click on text option "Save" on mobile
      Then click on mobile button "OK"

    @SendSms
    Scenario: Send sms
        Given test case starts
        Given select mobile "mobile2"
        Given browser is open
        When launch mobile app "message"
        Then send sms "Hello" from "USE_mobile2_deviceId" to "310000201"

    @SwitchAirPlaneModeONandOff
    Scenario: Switch MobileData OFF
        Given test case starts
        Given select mobile "mobileD"
        When launch mobile app "MobileNetworkSettings"
        Then switch on airplane mode
        Then switch off airplane mode

  @SwitchMobileDataON
  Scenario: Switch MobileData ON
      Given test case starts
      Given select mobile device "mobile2"
      When launch mobile app "MobileNetworkSettings"
      Then switch on mobile data

  @SwitchMobileDataOFF
  Scenario: Switch MobileData OFF
      Given test case starts
      Given select mobile device "mobile2"
      When launch mobile app "MobileNetworkSettings"
      Then switch off mobile data

