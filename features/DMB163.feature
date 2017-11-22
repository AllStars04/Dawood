@DMB-163
Feature:  DMB-163

   @TC_REG_R10_GUI_PROV_SIM_002_StateChange
   Scenario:Test to verify whether Opco User can view State Change details in SIM Provisioning History of a SIM

      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_IMSItest_WithProvisioningHistory"
      When click on button "Search"
      When click on link "USE_IMSItest_WithProvisioningHistory"
      Then verify text "Overview"
      When click on link "History"
      Then select radiobutton "Activity list"
      Then select drop down "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change state"
      #verify timestamp is visible along with "Change state"
      When click on link "Change state"
      Then verify text "Event date"
      Then verify text "Type"
      Then verify text "New state"
      Then verify text "Previous state"
      Then logout

   @TC_REG_R10_GUI_PROV_SIM_003_CSPChange
   Scenario:Test to verify whether Opco User can view Move CSP Change details in SIM Provisioning History of a SIM

      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_IMSItest_WithProvisioningHistory"
      When click on button "Search"
      When click on link "USE_IMSItest_WithProvisioningHistory"
      Then verify text "Overview"
      When click on link "History"
      Then select radiobutton "Activity list"
      Then select drop down "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change service profile"
      #verify timestamp is visible along with "Change service profile"
      When click on link "Change service profile"
      Then verify text "Event date"
      Then verify text "Type"
      Then verify text "New service profile"
      Then verify text "Previous service profile"
      Then verify text "New customer"
      Then verify text "Previous customer"
      Then logout

   @TC_REG_R10_GUI_PROV_SIM_004_AttributeChange
   Scenario:Test to verify whether Opco User can view APN Attribute Change details in SIM Provisioning History of a SIM

      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_IMSItest_WithAPNAttributeChange"
      When click on button "Search"
      When click on link "USE_IMSItest_WithAPNAttributeChange"
      Then verify text "Overview"
      When click on link "History"
      Then select radiobutton "Activity list"
      Then select drop down "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "Change IP address"
      #verify timestamp is visible along with "Change attributes"
      When click on link "Change IP address"
      Then verify text "Event date"
      Then verify text "Type"
      Then verify text "New IP address"
      Then verify text "Previous IP address"
      Then logout

   @TC_REG_R10_GUI_PROV_SIM_001_SIMProvisionHistory
   Scenario:Test to verify whether Opco User can view SIM Provisioning History of a SIM

      Given test case starts
      Given browser is open
      Then login
      When click on menu "Devices"
      When click on submenu "All devices"
      Then verify text "Results"
      Then enter textarea "IMSI" "USE_IMSItest_WithProvisioningHistory"
      When click on button "Search"
      When click on link "USE_IMSItest_WithProvisioningHistory"
      Then verify text "Overview"
      When click on link "History"
      Then select radiobutton "Activity list"
      Then select drop down "Type" "Administrative operations"
      When click on button "Search"
      Then verify text "New SIM record"
      #verify timestamp is visible along with "New"
      Then logout
