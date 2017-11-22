@SIM_Provisioning
Feature: SIM Provisioning
  This feature covers complete SIM Provisioning functionality.


  #Success#Configured
  @TC_SIM_PRVSNG_Create_SIM_Customer_Order_for_Customer
  Scenario:  Create SIM Customer Order for Customer - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Store"
    When click on submenu "SIM products"
    Then verify text "Catalogue"
    When click on link "See details"
    Then verify text "Product"
    When click on input "Organisation" and enter value "USE_CustomerOrder_Organisation"
    When click on button "Place order"
    Then verify text "Place order"
    Then enter date "* Delivery date" "USE_CustomerOrder_Date"
    Then enter "* Quantity" "USE_CustomerOrder_Quantity"
    Then enter "* New recipient" "USE_CustomerOrder_NewRecipient"
    Then enter "* Contact Name" "USE_CustomerOrder_AutoName"
    Then enter "* Phone" "USE_CustomerOrder_Phone"
    Then enter "* Email" "USE_CustomerOrder_Email"
    Then enter textarea "* Address" "USE_CustomerOrder_Address"
    Then enter "* City" "USE_CustomerOrder_City"
    Then select dropdown "* Country" "USE_CustomerOrder_Country"
    When click on button "Next"
    Then verify text "Please confirm the following data."
    When click on button "Order"
    Then verify text "Place order"
    Then verify text "was successfully submited."
    Then logout




  # Success#Configured
  #No ICCID range found selected SIMs
  @TC_SIM_PRVSNG_Create_SIM_Manufacturer_Order_for_Customer
  Scenario:  Create SIM Manufacturer Order for Customer - OPCO
    Given test case starts
    Given browser is open
    Then login
    When click on menu "Store"
    When click on submenu "Manufacturer orders"
    Then verify text "Manufacturer orders"
    When click on button "Create manufacturer order"
    Then verify text "Manufacturer order"
    Then enter "* Reference" "USE_ManufactureOrder_Reference"
    When click on input "* Organisation" and enter value "USE_ManufactureOrder_Organisation"
    Then enter "* Amount" "USE_ManufactureOrder_Amount"
    When click on button "Next"
    Then verify text "You are about to order"
    When click on button "Order"
    Then logout

