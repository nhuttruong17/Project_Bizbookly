*** Settings ***
Resource        ../../TestKeyWords/Common.robot
Resource        ../../Resources/Locators/CheckoutLocators.robot
Suite Setup     Basic Setup IOS
Suite Teardown  Basic TearDowns IOS
Library         Collections
Library         String

*** Variables ***
${Gift_card}        SGC240932327903
####Gift Card balances may be change with each payment
${Current_amount_Giftcard}        $224.80
${voucher_code_10per}    Voucher10per
${voucher_code_5fixed}    Voucher5fixed

*** Test Cases ***
#Method Credit Card
Verify Checkout Credit Card With Voucher Discount And Tip Amount IOS
    [Tags]    checkout    credit_card    voucher_discount    tip_amount    ios
    [Documentation]    Verify Credit Card checkout with a voucher discount and custom tip amount on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    ${voucher_code_10per}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Voucher Discount And Tip Percentage IOS
    [Tags]    checkout    credit_card    voucher_discount    tip_percentage    ios
    [Documentation]    Verify Credit Card checkout with a voucher discount and tip selected as percentage on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    ${voucher_code_10per}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Voucher Discount Without Tip IOS
    [Tags]    checkout    credit_card    voucher_discount    no_tip    ios
    [Documentation]    Verify Credit Card checkout with a voucher discount and skip tip on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    ${voucher_code_10per}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Fixed Amount Discount And Tips Amount IOS
    [Tags]    checkout    credit_card    fixed_discount    tip_amount    ios
    [Documentation]    Verify Credit Card checkout with fixed discount and custom amount tip on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Fixed Amount Discount And Tips Percentage IOS
    [Tags]    checkout    credit_card    fixed_discount    tip_percentage    ios
    [Documentation]    Verify Credit Card checkout with fixed discount and percentage tip on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Percentage Discount And Tips Percentage IOS
    [Tags]    checkout    credit_card    percentage_discount    tip_percentage    ios
    [Documentation]    Verify Credit Card checkout with percentage discount and percentage tip on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Percentage Discount And Tips Amount IOS
    [Tags]    checkout    credit_card    percentage_discount    tip_amount    ios
    [Documentation]    Verify Credit Card checkout with percentage discount and custom tip amount on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Fixed Amount Discount No Tip And SMS Receipt IOS
    [Tags]    checkout    credit_card    fixed_discount    no_tip    send_receipt_sms    ios
    [Documentation]    Verify Credit Card checkout with fixed discount, no tip and SMS receipt on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then System should display notify message as    The receipt has been sent successfully.
    When Choose No Receipt

Verify Checkout Credit Card With Percentage Discount No Tip And Email Receipt IOS
    [Tags]    checkout    credit_card    percentage_discount    no_tip    send_receipt    ios
    [Documentation]    Verify Credit Card checkout with percentage discount, no tip and email receipt on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display notify message as     Send Receipt Successfully
    When Choose No Receipt

Verify Basic Credit Card Checkout Without Discount And Tip IOS
    [Tags]    checkout    credit_card    no_discount    no_tip    ios    basic
    [Documentation]    Verify basic Credit Card checkout without any discount or tip on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Credit Card
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'no_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

#Method Credit Card

#Method Gift Card
Validate Gift Card Not Found IOS
    [Tags]    checkout    gift_card    validation    ios
    [Documentation]    Verify system handles invalid gift card number correctly on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    And User selects payment method as Gift Card
    When Pay By Gift Card    SGC8891M1
    Then System should display text on screen as    Gift Card Not Found

Validate Gift Card Expired IOS
    [Tags]    checkout    gift_card    validation    ios
    [Documentation]    Verify system handles expired gift card correctly on iOS.
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC8891M1
    And Pay By Gift Card    SGC240954437458
    Then System should display text on screen as    Gift card has been expired.

Validate Gift Card Deactivated IOS
    [Tags]    checkout    gift_card    validation    ios
    [Documentation]    Verify system handles deactivated gift card correctly on iOS.
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC240954437458
    And Pay By Gift Card    SGC240961690283 
    Then System should display text on screen as    The gift card has been deactivated

Validate Gift Card Insufficient Balance IOS
    [Tags]    checkout    gift_card    validation    ios
    [Documentation]    Verify system handles gift card with insufficient balance correctly on iOS.
    Given User at screen Enter Gift Card Code  
    When Click And Clear Field    SGC240961690283
    And Pay By Gift Card    SGC240950990238
    Then System should display text on screen as    The gift card amount is not enough to use.

Verify Gift Card Basic Checkout IOS
    [Tags]    checkout    gift_card    success    ios
    [Documentation]    Verify basic gift card checkout flow on iOS.
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC240950990238
    And Pay By Gift Card    ${Gift_card}
    And User clicks Submit button
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Gift Card Checkout With Percentage Discount And Email IOS
    [Tags]    checkout    gift_card    percentage_discount    send_email    ios
    [Documentation]    Verify gift card checkout with percentage discount and email receipt on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    And User selects payment method as Gift Card
    When Pay By Gift Card     ${Gift_card}
    And User clicks Submit button
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display notify message as     Send Receipt Successfully
    When Choose No Receipt

#Method Paid Externally
Verify Checkout Paid Externally Apply Voucher and without tip IOS
    [Tags]    checkout    voucher    payment    external    no_tip    ios
    [Documentation]    Verify full checkout flow with voucher applied, no tip, and paid externally on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher   2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip custom amount IOS
    [Tags]    checkout    voucher    payment    external    tip    custom    ios
    [Documentation]    Verify full checkout flow with voucher applied, tip custom amount, and paid externally on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    ${voucher_code_10per}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip percentage IOS
    [Tags]    checkout    voucher    payment    external    tip    percentage    ios
    [Documentation]    Verify full checkout flow with voucher applied, tip percentage, and paid externally on iOS
    Given Find and choose Technician IOS     caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    ${voucher_code_10per}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

# # Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
# Verify Checkout Paid Externally Maximum Discount Amount with Option Apply Voucher
#     [Tags]    voucher    max_discount    positive
#     [Documentation]    Verify system applies only the maximum allowed discount amount
#     Given Find and choose Technician IOS    caisse
#     And Find Categories services      Acrylic Full Set w/ Gel
#     And Find Categories services      Dip w/ Aloe Vera Manicure
#     Then Check validation error message Android    //android.view.View[@name="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@name="$5.00"]    $5.00
#     And Check validation error message Android    //android.view.View[@name="$105.00"]    $105.00
#     When Apply Voucher Discount    maximumdiscount
#     And Click on Element mobile    ${elm_btn_Submit_IOS}
#     Then Check validation error message Android    //android.view.View[@name="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@name="$4.50"]    $4.50
#     And Check validation error message Android    //android.view.View[@name="$94.50"]    $94.50
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@name="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$94.50"])[3]    $94.50
#     And Click on Element mobile    //android.view.View[@name="Paid Externally"]
#     ##Tips total amount
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$90.00"])[1]    $90.00
#     When Click on Element mobile    ${elm_btn_Skip}
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$90.00"])[1]    $90.00
#     And Click on Element mobile    ${elm_btn_BeginCharge}
    
#     Then Check validation error message Android    //android.view.View[@name="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt


Verify Checkout Paid Externally without discount and without tip IOS
    [Tags]    checkout    no_voucher    no_tip    external_payment    success    ios
    [Documentation]    Verify full checkout flow without any voucher or tip applied on iOS,
    ...    paid externally, and ensure total amount remains unchanged with confirmation displayed.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'no_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally without discount and without tip and send Email IOS
    [Tags]    checkout    no_voucher    no_tip    external_payment    send_email    success    ios
    [Documentation]    Verify full checkout flow without voucher and tip on iOS,
    ...    using external payment and sending receipt to email successfully.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'no_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display text on screen as    Send Receipt Successfully
    When Choose No Receipt

Verify Checkout Paid Externally without discount and without tip and send Sms IOS
    [Tags]    checkout    no_voucher    no_tip    external_payment    send_sms    success    ios
    [Documentation]    Verify full checkout flow without voucher and tip on iOS,
    ...    using external payment and sending receipt via SMS successfully.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'no_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then System should display text on screen as    The receipt has been sent successfully.
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and without tip IOS
    [Tags]    checkout    percentage_discount    no_tip    external_payment    success    ios
    [Documentation]    Verify checkout flow with 10% percentage discount applied and no tip on iOS,
    ...    using external payment and ensuring price updates correctly.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip percentage IOS
    [Tags]    checkout    paid_externally    percentage_discount    tip_percentage    success    ios
    [Documentation]    Verify the checkout flow when applying a 10% percentage discount and a 5% tip on iOS.
    ...    Ensure the system calculates discount and tip correctly.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip custom amount IOS
    [Tags]    checkout    paid_externally    percentage_discount    custom_tip    success    ios
    [Documentation]    Verify the checkout flow when applying a 10% percentage discount and a custom tip amount on iOS.
    ...    Ensure the system calculates the discount and custom tip correctly.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and without tip IOS
    [Tags]    checkout    paid_externally    fixed_discount    no_tip    success    ios
    [Documentation]    Verify the checkout flow when applying a fixed discount amount ($5.00) and skipping tip on iOS.
    ...    Ensure the system correctly calculates new total and handles external payment.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'none'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip custom amount IOS
    [Tags]    checkout    paid_externally    fixed_discount    custom_tip    success    ios
    [Documentation]    Verify the checkout flow with fixed discount ($5.00) and custom tip ($3.00) using Paid Externally method on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_amount'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip percentage IOS
    [Tags]    checkout    paid_externally    fixed_discount    tip_percentage    success    ios
    [Documentation]    Verify the checkout flow with fixed discount ($5.00) and tip 5% using Paid Externally method on iOS.
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Paid Externally
    And Tip on service random    'tip_percentage'
    Then Get value from system and compare with result for Tip    'have_discount'
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt
    
#Method Paid Externally

##Method Cash
Verify Checkout Cash Without Discount And Without Tip IOS
    [Tags]    checkout    cash    no_discount    no_tip    ios    success
    [Documentation]    Verify basic cash payment flow without any discounts or tips on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Cash
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Cash Without Discount And Send Email IOS
    [Tags]    checkout    cash    no_discount    send_email    ios    success
    [Documentation]    Verify cash payment flow without discount and sending email receipt on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Cash
    And Tip on service random    'none'
    When User Begins Charge
    Then System should display notify message as    Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display notify message as    Send Receipt Successfully
    When Choose No Receipt

Verify Checkout Cash Without Discount And Send SMS IOS
    [Tags]    checkout    cash    no_discount    send_sms    ios    success
    [Documentation]    Verify cash payment flow without discount and sending SMS receipt on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'none'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'no_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'no_discount'
    When User selects payment method as Cash
    And Tip on service random    'none'
    When User Begins Charge
    Then System should display notify message as    Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then System should display notify message as    The receipt has been sent successfully.
    When Choose No Receipt

Verify Checkout Cash With Percentage Discount IOS
    [Tags]    checkout    cash    percentage_discount    ios    success
    [Documentation]    Verify cash payment flow with percentage discount on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'percentage'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Cash
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Cash With Fixed Amount Discount IOS
    [Tags]    checkout    cash    fixed_discount    ios    success
    [Documentation]    Verify cash payment flow with fixed amount discount on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'fixed_amount'    'on'    ${None}
    Then Get value from system and compare with result for billing summary    'have_discount'
    When User proceeds to Payment
    Then Get value from system and compare with result for Balance Due    'have_discount'
    When User selects payment method as Cash
    When User Begins Charge
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

##Voucher Validation Tests
Verify Checkout With Expired Voucher IOS
    [Tags]    checkout    voucher    negative    ios
    [Documentation]    Verify system handles expired voucher correctly on iOS
    Given Find and choose Technician IOS    caisse
    When Select service and add on & apply voucher    2    2    'voucher'    'on'    expired
    Then System should display notify message as    The voucher has been expired!

Validate Voucher Usage Limit Exceeded IOS
    [Tags]    voucher    limit    negative    ios
    [Documentation]    Verify system handles voucher usage limit exceeded correctly on iOS
    When Click And Clear Field    expired
    Then System should display notify message as    Voucher has reached its usage limit.

Validate User Voucher Limit Exceeded IOS
    [Tags]    voucher    user_limit    negative    ios
    [Documentation]    Verify system handles user voucher limit exceeded correctly on iOS
    When Click And Clear Field    usageexceeded
    Then System should display notify message as    Voucher has reached its usage limit.

Validate Minimum Spend Requirement For Voucher IOS
    [Tags]    voucher    min_spend    negative    ios
    [Documentation]    Verify system handles minimum spend requirement correctly on iOS
    When Click And Clear Field    usageexceeded
    Then System should display notify message as    The minimum spent required to apply this voucher is $50.00

# Verify Checkout Cash with Option Apply Voucher -> Dev inprogress fixing
#     Given User at screen enter voucher code
#     When Click on Element mobile        //android.view.View[@name="Cancel"]
#     When Find Categories services      Gel w/ Regular Mani
#     Then Check validation error message Android          //android.view.View[@name="$70.00"]        $70.00
#     Then Check validation error message Android          //android.view.View[@name="$3.50"]         $3.50
#     Then Check validation error message Android          //android.view.View[@name="$73.50"]         $73.50
#     When Apply Voucher Discount    Testvoucher
#     When Click on Element mobile    ${elm_btn_Submit_IOS}
#     Then Check validation error message Android         xpath=(//android.view.View[@name="-$5.00"])[1]        -$5.00
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@name="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$47.25"])[3]    $47.25
#     And Click on Element mobile    ${elm_Option_Cash_IOS}
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$47.25"])[1]    $47.25
#     And Click on Element mobile    ${elm_btn_BeginCharge}
#     Then Check validation error message Android    //android.view.View[@name="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt

# Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
# Verify Checkout Maximum Discount Amount with Option Apply Voucher
#     [Tags]    voucher    max_discount    positive
#     [Documentation]    Verify system applies only the maximum allowed discount amount
#     Given Find and choose Technician IOS    caisse
#     And Find Categories services      Acrylic Full Set w/ Gel
#     And Find Categories services      Dip w/ Aloe Vera Manicure
#     Then Check validation error message Android    //android.view.View[@name="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@name="$5.00"]    $5.00
#     And Check validation error message Android    //android.view.View[@name="$105.00"]    $105.00
#     When Apply Voucher Discount    maximumdiscount
#     Then Check validation error message Android    //android.view.View[@name="$95.00"]    $95.00
#     And Check validation error message Android    //android.view.View[@name="$4.75"]    $4.75
#     And Check validation error message Android    //android.view.View[@name="$99.75"]    $99.75
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@name="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$99.75"])[3]    $99.75
#     And Click on Element mobile    ${elm_Option_Cash_IOS}
#     Then Check validation error message Android          xpath=(//android.view.View[@name="$99.75"])[1]    $99.75
#     And Click on Element mobile    ${elm_btn_BeginCharge}
#     Then Check validation error message Android    //android.view.View[@name="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt



    
*** Keywords ***
User at screen Enter Gift Card Code
    AppiumLibrary.Wait Until Element Is Visible    //XCUIElementTypeStaticText[@name="Gift Card"]        10s

System should display notify message as
    [Arguments]    ${message}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="${message}"]        ${message}

System should display text on screen as
    [Arguments]    ${text}
    Check validation error message mobile     //XCUIElementTypeStaticText[@name="${text}"]        ${text}

# System should display tip detail with technician and amount tip
#     [Arguments]    ${technician}    ${tip}
#     AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@name, "${technician}") and contains(@name, "${tip}")]    10s
#     ${desc}=    AppiumLibrary.Get Element Attribute    //android.view.View[contains(@name, "${technician}") and contains(@name, "${tip}")]    name
#     Should Contain    ${desc}    ${technician}
#     Should Contain    ${desc}    ${tip}

User proceeds to Payment
    Click on Element mobile    ${elm_btn_Payment_IOS}

User clicks Submit button
    Click on Element mobile    ${elm_btn_Submit_IOS}

User Skips Tip
    Click on Element mobile    ${elm_btn_Skip_IOS}   

User Begins Charge
    Click on Element mobile    ${elm_btn_BeginCharge_IOS}

User selects Custom Tip option
    Click on Element mobile    ${elm_Option_CustomAmount_IOS}


## Method Payment
User selects payment method as Cash
    Click on Element mobile    ${elm_Option_Cash_IOS}

User selects payment method as Paid Externally
    Click on Element mobile    ${elm_Method_PaidExternally_IOS}

User selects payment method as Gift Card
    Click on Element mobile    ${elm_Method_GiftCard_IOS}

User selects payment method as Credit Card
    Click on Element mobile    ${elm_Method_CreditCard_IOS}
## Method Payment

Pay By Gift Card
    [Arguments]    ${gift_card}
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile    //android.widget.EditText    ${gift_card}
    Click on Element mobile    //android.view.View[@name="Apply"]

Pay By Cash
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    ${elm_Option_Cash_IOS}
    Click on Element mobile    ${elm_btn_BeginCharge}
Sign And Confirm Payment
    AppiumLibrary.Wait Until Element Is Visible    ${elm_btn_Done_IOS}    10s
    Swipe    600    300    1250    300
    Swipe    928    300    918    750
    Click on Element mobile    ${elm_btn_Done_IOS}

Choose No Receipt
    Click on Element mobile    ${elm_Option_NoReceipt_IOS}

Choose send receipt to Email
    [Arguments]    ${email}
    Click on Element mobile    //android.view.View[@name="Email"]
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile     //android.widget.EditText    ${email}
    Click on Element mobile    //android.widget.ScrollView/android.view.View[7]
    Click on Element mobile    //android.widget.EditText[@text="${email}"]/android.view.View
    Click on Element mobile    //android.view.View[@name="SEND"]

Choose send receipt to SMS    
    [Arguments]    @{digits}
    Click on Element mobile    //android.view.View[@name="Text (SMS)"]
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@name="${digit}" and @clickable="true"]
    END

    Click on Element mobile    //android.view.View[@name="Send"]


### Test 
Select service and add on & apply voucher    ### Nếu k sử dụng voucher thì sửa lại $vouchercode= ${None}
    [Arguments]    ${number_of_services}       ${number_of_add_ons}        ${discount_type}       ${include_discount}        ${voucher_code}
    ${service_list}=    AppiumLibrary.Get Webelements    xpath=(//XCUIElementTypeApplication[@name="Salonbookly Manager Dev"]//XCUIElementTypeOther[5]//XCUIElementTypeOther[2]//XCUIElementTypeStaticText[contains(@name, "$")])
    ${add_on_list}=    AppiumLibrary.Get Webelements    xpath=(//XCUIElementTypeApplication[@name="Salonbookly Manager Dev"]//XCUIElementTypeOther[6]//XCUIElementTypeOther[2]//XCUIElementTypeStaticText[contains(@name, "$")])
    ${count_service}=    Get Length    ${service_list}
    ${count_add_on}=    Get Length    ${add_on_list}
    Log    Số lượng service thực sự tìm thấy: ${count_service}
    Log    Số lượng add on thực sự tìm thấy: ${count_add_on}
    Run Keyword If    ${count_service} < ${number_of_services}    Fail    Không đủ service thực sự để chọn ${number_of_services} dịch vụ!
    Run Keyword If    ${count_add_on} < ${number_of_add_ons}    Fail    Không đủ add on thực sự để chọn ${number_of_add_ons} add on!

    ${indexes_service}=    Evaluate    random.sample(range(${count_service}), ${number_of_services})    modules=random
    ${indexes_add_on}=    Evaluate    random.sample(range(${count_add_on}), ${number_of_add_ons})    modules=random
    ${selected_service_texts}=    Create List
    ${selected_add_on_texts}=    Create List
    ${subtotal_before_discount_service}=    Set Variable    ${0.0}
    ${subtotal_before_discount_list_of_add_ons}=    Set Variable    ${0.0}
    ${total_tax_value}=             Set Variable    ${0.0}
    ${random_discount}=             Set Variable    ${0.0}

    FOR    ${index}    IN    @{indexes_service}
        ${service_element}=    Get From List    ${service_list}    ${index}
        ${service_text}=       AppiumLibrary.Get Element Attribute    ${service_element}    name
        Log    Đã chọn Service: ${service_text}
        Append To List         ${selected_service_texts}    ${service_text}
        AppiumLibrary.Click Element    ${service_element}

        ${price}=    Get Amount Value From Service Desc    ${service_text}
        ${subtotal_before_discount_service}=    Evaluate    ${subtotal_before_discount_service} + ${price}
        Log    ${subtotal_before_discount_service}
    END

    FOR    ${index}    IN    @{indexes_add_on}
        ${add_on_element}=    Get From List    ${add_on_list}    ${index}
        ${add_on_text}=       AppiumLibrary.Get Element Attribute    ${add_on_element}    name
        Log    Đã chọn Add On: ${add_on_text}
        Append To List         ${selected_add_on_texts}    ${add_on_text}
        AppiumLibrary.Click Element    ${add_on_element}
        
        ${price}=    Get Amount Value From Service Desc    ${add_on_text}
        ${subtotal_before_discount_list_of_add_ons}=    Evaluate    ${subtotal_before_discount_list_of_add_ons} + ${price}
        Log    ${subtotal_before_discount_list_of_add_ons}

    END

    ${Total_service}=    Evaluate    ${subtotal_before_discount_service} + ${subtotal_before_discount_list_of_add_ons}
    Log    ${Total_service}
    
    # --- Tính toán Discount ---
    IF    ${discount_type} == 'percentage'
        Click on Element mobile    //XCUIElementTypeStaticText[@index=27]
        Click on Element mobile    //XCUIElementTypeOther[@name="Quick discount"]
        IF    ${include_discount} == 'off'
            Click on Element mobile    //XCUIElementTypeOther[contains(@name, "%")]
            # Tạo số ngẫu nhiên từ 1% đến 100%
            ${discount_percentage_subtotal}=     Evaluate       random.randint(1, 100)        modules=random
            Log    ${discount_percentage_subtotal}
            # Tính % của số ngẫu nhiên cho subtotal
            ${random_discount}=    Evaluate    round((${discount_percentage_subtotal} / 100) * ${subtotal_before_discount_service}, 2)
            Log    ${random_discount}
            # Chuyển số ngẫu nhiên thành chuỗi
            ${number_str}=    Convert To String    ${discount_percentage_subtotal}
            Log    ${number_str}
            # Chuyển số chuỗi thành danh sách
            ${number_list}=   Convert To List    ${number_str}
            Log    ${number_list}
            FOR    ${digit}    IN    @{number_list}
                Click on Element mobile    //XCUIElementTypeStaticText[@name= "${digit}" and @width=105]
            END
            Click on Element mobile    ${elm_btn_Done_IOS}
            Click on Element mobile    ${elm_btn_Submit_IOS}
        ELSE IF    ${include_discount} == 'on'
            Click on Element mobile    //XCUIElementTypeStaticText[@name="Off"]
            Click on Element mobile    //XCUIElementTypeOther[contains(@name, "%")]
            # Tạo số ngẫu nhiên từ 1% đến 100%
            ${discount_percentage_subtotal}=     Evaluate       random.randint(1, 100)        modules=random
            Log    ${discount_percentage_subtotal}
            # Tính % của số ngẫu nhiên cho subtotal
            ${random_discount}=    Evaluate    round((${discount_percentage_subtotal} / 100) * ${Total_service}, 2)
            Log    ${random_discount}
            # Chuyển số ngẫu nhiên thành chuỗi
            ${number_str}=    Convert To String    ${discount_percentage_subtotal}
            Log    ${number_str}
            # Chuyển số chuỗi thành danh sách
            ${number_list}=   Convert To List    ${number_str}
            Log    ${number_list}
            FOR    ${digit}    IN    @{number_list}
                Click on Element mobile    //XCUIElementTypeStaticText[@name= "${digit}" and @width=105]
            END
            Click on Element mobile    ${elm_btn_Done_IOS}
            Click on Element mobile    ${elm_btn_Submit_IOS}
        ELSE
            Fail    Invalid include discount: ${include_discount} must be 'off' or 'on'.
        END

    ELSE IF  ${discount_type} == 'fixed_amount'
        Click on Element mobile    //XCUIElementTypeStaticText[@index=27]
        Click on Element mobile    //XCUIElementTypeOther[@name="Quick discount"]
        Click on Element mobile    //XCUIElementTypeStaticText[@name="Fixed amount"]
        Click on Element mobile    //XCUIElementTypeOther[contains(@name, "$")]
        # Định dạng subtotal thành 2 chữ số sau dấu thập phân
        ${format_subtotal}=     Evaluate    '{:.2f}'.format(${Total_service})
        Log    ${format_subtotal}
        # Tạo một giá trị giảm giá ngẫu nhiên từ 1.00 đến ${format_subtotal} và làm tròn đến 2 chữ số
        # ${random_discount}=     Evaluate       round(random.uniform(1.00, ${format_subtotal}), 2)    modules=random
        # Log    ${random_discount}

        ${random_fixed}=     Evaluate       random.uniform(1.00, ${format_subtotal})    modules=random
        Log    ${random_fixed}
        ${random_discount}=     Evaluate    int(${random_fixed} * 100) / 100
        Log  ${random_discount}
        ${number_str}=    Convert To String    ${random_discount}
        Log    ${number_str}
        # Cắt bỏ dấu . để nhập numberpad
        ${number_str_no_dot}=    Replace String    ${number_str}    .    ${EMPTY}
        Log    ${number_str_no_dot}
        ${number_list}=   Convert To List    ${number_str_no_dot}
        FOR    ${digit}    IN    @{number_list}
            Click on Element mobile    //XCUIElementTypeStaticText[@name="${digit}"]
        END
        Click on Element mobile    ${elm_btn_Done_IOS}
        Click on Element mobile    ${elm_btn_Submit_IOS}

    ELSE IF    ${discount_type} == 'voucher'
        Click on Element mobile    //XCUIElementTypeStaticText[@index=27]
        Click on Element mobile    //XCUIElementTypeOther[@name="Apply Voucher"]
        Click on Element mobile    //XCUIElementTypeTextField[@name="Enter voucher code"]
        Fill Text Input mobile    //XCUIElementTypeTextField[@name="Enter voucher code"]    ${voucher_code}
        # Kiểm tra xem voucher có tồn tại và hiển thị
        AppiumLibrary.Wait Until Element Is Visible    //XCUIElementTypeStaticText[contains(@name, "Code: #SBV${voucher_code}")]
        ${amount_voucher}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "Code: #SBV${voucher_code}")]    name
        Log    ${amount_voucher}

        ${amount_list}=    Evaluate    re.findall(r'(\\d+(?:\\.\\d+)?(?= off|%))', """${amount_voucher}""", re.MULTILINE)    modules=re
        Log    Amount List: ${amount_list}

        # Kiểm tra loại voucher (fixed hay percentage)
        ${is_percentage}=    Evaluate    """${amount_voucher}""".find('%') != -1
        ${is_fixed}=    Evaluate    """${amount_voucher}""".find(' off') != -1
        
        IF    '${is_percentage}' == 'True'
            Log    Loại voucher: percentage
            Log    Giá trị Percentage: ${amount_list}[0]
            ${random_discount}=    Evaluate    float(${amount_list}[0]) * ${Total_service} / 100
        ELSE IF    '${is_fixed}' == 'True'
            Log    Loại voucher: fixed
            Log    Giá trị Fixed amount: ${amount_list}[0]
            ${random_discount}=    Evaluate    float(${amount_list}[0])
        ELSE
            Fail    Không phải voucher hợp lệ, không có giá trị fixed hay percentage.
        END
        Click on Element mobile    //XCUIElementTypeStaticText[contains(@name, "Code: #SBV${voucher_code}")]
        Click on Element mobile    ${elm_btn_Submit_IOS}

    ELSE IF    ${discount_type} == 'none'
        No Operation
    ELSE 
        Fail    Invalid discount type: ${discount_type} must be 'fixed' or 'percent'.
    END
    
    # --- Tính toán Subtotal sau discount, Tax và Total cuối cùng ---
    ${final_subtotal_after_discount}=    Evaluate    round(${Total_service} - ${random_discount}, 2)
    # ${total_tax_value}=                  Evaluate    round(${final_subtotal_after_discount} * 0.05, 2) # Thuế tính trên subtotal sau discount, tính tax không làm tròn
    ${total_tax_value}=    Evaluate    str(__import__('decimal').Decimal(str(${final_subtotal_after_discount} * 0.05)).quantize(__import__('decimal').Decimal('0.01'), rounding=__import__('decimal').ROUND_HALF_UP))   #>=5 tính tax làm tròn
    # ${total_tax_value}=    Evaluate    math.ceil(${final_subtotal_after_discount} * 0.05 * 100) / 100    modules=math        # Thuế tính trên subtotal sau discount, tính tax làm tròn
    ${final_total_value}=                Evaluate    round(${final_subtotal_after_discount} + ${total_tax_value}, 2)
    
    # Định dạng lại về dạng 2 số thập phân
    ${final_subtotal_str}=    Evaluate    f\"{${final_subtotal_after_discount}:.2f}\"
    ${final_tax_str}=         Evaluate    f\"{${total_tax_value}:.2f}\"
    ${final_total_str}=       Evaluate    f\"{${final_total_value}:.2f}\"
    ${final_discount_str}=    Evaluate    f\"{${random_discount}:.2f}\"
    ${final_before_discount}=    Evaluate    f\"{${Total_service}:.2f}\"

    Log    Tổng Price (tính toán): Subtotal=${final_subtotal_str}, Discount=${final_discount_str}, Tax=${final_tax_str}, Total=${final_total_str}, Subtotalbefore=${final_before_discount}

    # Lưu vào biến Suite
    Set Suite Variable    ${ORIGINAL_PRICE_SUM}       ${final_subtotal_str} 
    Set Suite Variable    ${ORIGINAL_TAX_SUM}         ${final_tax_str}
    Set Suite Variable    ${ORIGINAL_TOTAL_SUM}       ${final_total_str}
    Set Suite Variable    ${ORIGINAL_DISCOUNT_VALUE}  ${final_discount_str} 
    Set Suite Variable    ${SELECTED_SERVICE_DESCS}   ${selected_service_texts}
    Set Suite Variable    ${SELECTED_LISTOF_ADD-ONS}   ${selected_add_on_texts}
    Set Suite Variable    ${DISCOUNT_TYPE_APPLIED}    ${discount_type} 
    Set Suite Variable    ${SUBTOTAL_BEFORE_DISCOUNT}     ${final_before_discount}

Get value from system and compare with result for billing summary
    [Arguments]        ${use_discount}
    IF    ${use_discount} == 'have_discount'
        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=24]        name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=26]        name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Total Balance Due
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=31]        name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}

        ## Get value Discount
        ${Discount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "-$")]        name
        ${Discount_system_value}=    Get Amount Value From Service Desc    ${Discount_system}
        ${Discount_system_value}=    Evaluate    f\"{${Discount_system_value}:.2f}\"
        Log    ${Discount_system_value}

    ELSE IF    ${use_discount} == 'no_discount'
        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=24]        name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=28]        name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Total Balance Due
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=29]        name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}

        ## Get value Discount
        ${Discount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "-$")]     name
        ${Discount_system_value}=    Get Amount Value From Service Desc    ${Discount_system}
        ${Discount_system_value}=    Evaluate    f\"{${Discount_system_value}:.2f}\"
        Log    ${Discount_system_value}
    ELSE
        Fail    Invalid discount type: ${Tax_system} must be 'have_discount' or 'no_discount'.
    END

    ## So sánh giá trị của 
    Should Be Equal    ${Subtotal_system_value}    ${SUBTOTAL_BEFORE_DISCOUNT}    Subtotal_system_value không khớp với SUBTOTAL_BEFORE_DISCOUNT    
    Should Be Equal    ${Tax_system_value}    ${ORIGINAL_TAX_SUM}    Tax_system_value không khớp với ORIGINAL_TAX_SUM
    Should Be Equal    ${Total_system_value}    ${ORIGINAL_TOTAL_SUM}    Total_system_value không khớp với ORIGINAL_TOTAL_SUM
    Should Be Equal    ${Discount_system_value}    ${ORIGINAL_DISCOUNT_VALUE}    Discount_system_value không khớp với ORIGINAL_DISCOUNT_VALUE
    
Get value from system and compare with result for Balance Due
    [Arguments]        ${use_discount}
    IF    ${use_discount} == 'have_discount'
        ## Get value Balance Due
        ${BalanceDue_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=2]    name
        ${BalanceDue_system_value}=    Get Amount Value From Service Desc    ${BalanceDue_system}
        ${Balancedue_system_value}=    Evaluate    f\"{${BalanceDue_system_value}:.2f}\"
        Log    ${BalanceDue_system_value}

        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=11]    name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Discount
        ${Discount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=13]    name
        ${Discount_system_value}=    Get Amount Value From Service Desc    ${Discount_system}
        ${Discount_system_value}=    Evaluate    f\"{${Discount_system_value}:.2f}\"
        Log    ${Discount_system_value}

        ## Get value Discounted Subtotal
        ${DiscountedSubtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=15]    name
        ${DiscountedSubtotal_system_value}=    Get Amount Value From Service Desc    ${DiscountedSubtotal_system}
        ${DiscountedSubtotal_system_value}=    Evaluate    f\"{${DiscountedSubtotal_system_value}:.2f}\"
        Log    ${DiscountedSubtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=17]    name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Tip
        ${Tip_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=19]    name
        ${Tip_system_value}=    Get Amount Value From Service Desc    ${Tip_system}
        ${Tip_system_value}=    Evaluate    f\"{${Tip_system_value}:.2f}\"
        Log    ${Tip_system_value}

        ## Get value Total
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=21]    name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}

        ## So sánh giá trị của Robot Framework VS giá trị của hệ thống
        Should Be Equal    ${BalanceDue_system_value}    ${ORIGINAL_TOTAL_SUM}    BalanceDue_system_value không khớp với ORIGINAL_TOTAL_SUM
        Should Be Equal    ${Subtotal_system_value}    ${SUBTOTAL_BEFORE_DISCOUNT}    Subtotal_system_value không khớp với SUBTOTAL_BEFORE_DISCOUNT
        Should Be Equal    ${Discount_system_value}    ${ORIGINAL_DISCOUNT_VALUE}    Discount_system_value không khớp với ORIGINAL_DISCOUNT_VALUE
        Should Be Equal    ${DiscountedSubtotal_system_value}    ${ORIGINAL_PRICE_SUM}    DiscountedSubtotal_system_value không khớp với ORIGINAL_PRICE_SUM
        Should Be Equal    ${Tax_system_value}   ${ORIGINAL_TAX_SUM}    Tax_system_value không khớp với ORIGINAL_TAX_SUM
        Should Be Equal    ${Tip_system_value}    0.00    Tip_system_value không khớp với 0.00
        Should Be Equal    ${Total_system_value}    ${ORIGINAL_TOTAL_SUM}    Total_system_value không khớp với ORIGINAL_TOTAL_SUM
        
    ELSE IF    ${use_discount} == 'no_discount'
        ## Get value Balance Due
        ${BalanceDue_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=2]    name
        ${BalanceDue_system_value}=    Get Amount Value From Service Desc    ${BalanceDue_system}
        ${Balancedue_system_value}=    Evaluate    f\"{${BalanceDue_system_value}:.2f}\"
        Log    ${BalanceDue_system_value}

        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=11]    name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=13]    name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Tip
        ${Tip_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=15]    name
        ${Tip_system_value}=    Get Amount Value From Service Desc    ${Tip_system}
        ${Tip_system_value}=    Evaluate    f\"{${Tip_system_value}:.2f}\"
        Log    ${Tip_system_value}

        ## Get value Total
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=17]    name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}

        ## So sánh giá trị của Robot Framework VS giá trị của hệ thống
        Should Be Equal    ${BalanceDue_system_value}         ${ORIGINAL_TOTAL_SUM}              BalanceDue_system_value không khớp với ORIGINAL_TOTAL_SUM
        Should Be Equal    ${Subtotal_system_value}           ${SUBTOTAL_BEFORE_DISCOUNT}        Subtotal_system_value không khớp với SUBTOTAL_BEFORE_DISCOUNT
        Should Be Equal    ${Tax_system_value}                ${ORIGINAL_TAX_SUM}                Tax_system_value không khớp với ORIGINAL_TAX_SUM
        Should Be Equal    ${Tip_system_value}                0.00                               Tip_system_value không khớp với 0.00
        Should Be Equal    ${Total_system_value}              ${ORIGINAL_TOTAL_SUM}              Total_system_value không khớp với ORIGINAL_TOTAL_SUM
        
    ELSE
        Fail    Invalid discount type: ${use_discount} must be 'have_discount' or 'no_discount'.    
    END
    
Tip on service random
    ## Tính toán Tip
    [Arguments]    ${tip_type}
    ${random_tip}=             Set Variable    ${0.0}
    IF    ${tip_type} == 'tip_percentage'
        # Lấy tất cả các phần tử tip % có sẵn
        ${real_tip_percentage}=    AppiumLibrary.Get Webelements    xpath=//XCUIElementTypeStaticText[contains(@name, "%")]
        # Đếm các phần tử lấy được
        ${count}=    Get Length    ${real_tip_percentage}
        Log    Số lượng service thực sự tìm thấy: ${count}
        # Chọn ngẫu nhiên một phần tử trong tip % 
        ${random_tip_percentage}=    Evaluate    random.randint(0, ${count} - 1)    modules=random
        # Lấy phần tử từ list bằng chỉ mục
        ${selected_tip_element}=    Get From List    ${real_tip_percentage}    ${random_tip_percentage}
        ${selected_tip_desc}=       AppiumLibrary.Get Element Attribute    ${selected_tip_element}    name
        Log    Đã chọn tip phần trăm: ${selected_tip_desc}
        # Tách $amount để lấy amount% 
        ${tip_percent_match}=    Get Regexp Matches    ${selected_tip_desc}    (\\d+%)    1
        Log    ${tip_percent_match}
        #Click vào phần tử tip đã chọn
        AppiumLibrary.Click Element    //XCUIElementTypeStaticText[contains(@name, "${selected_tip_desc}")]

        ${get_tip_percentage}=    Get From List    ${tip_percent_match}    0
        Log    ${get_tip_percentage}
        ${tip_percentage_amount}=   Replace String    ${get_tip_percentage}    %    ${EMPTY}
        Log    ${tip_percentage_amount}
        ${random_tip}=    Evaluate    round(${ORIGINAL_PRICE_SUM} * ${tip_percentage_amount} / 100, 2)
        Log    ${random_tip}
    
    ELSE IF  ${tip_type} == 'tip_amount'
        Click on Element mobile    ${elm_Option_CustomAmount}
        # Tạo một giá trị giảm giá ngẫu nhiên từ 1.00 đến ${format_subtotal} và làm tròn đến 2 chữ số
        # ${random_tip}=     Evaluate       round(random.uniform(1.00, ${ORIGINAL_PRICE_SUM}), 2)    modules=random
        # Log    ${random_tip}

        ${random_fixed}=     Evaluate       random.uniform(1.00, ${ORIGINAL_PRICE_SUM})    modules=random
        Log    ${random_fixed}
        ${random_tip}=     Evaluate    int(${random_fixed} * 100) / 100
        Log  ${random_tip}
        # Chuyển số ngẫu nhiên thành chuỗi
        ${number_str}=    Convert To String    ${random_tip}
        Log    ${number_str}
        # Cắt bỏ dấu . để nhập numberpad
        ${number_str_no_dot}=    Replace String    ${number_str}    .    ${EMPTY}
        Log    ${number_str_no_dot}
        ${number_list}=   Convert To List    ${number_str_no_dot}
        FOR    ${digit}    IN    @{number_list}
            Click on Element mobile    //XCUIElementTypeStaticText[@name="${digit}"]
        END
        Click on Element mobile    ${elm_btn_Submit_IOS}

    ELSE IF    ${tip_type} == 'none'
        Click on Element mobile    ${elm_btn_Skip_IOS}
    ELSE 
        Fail    Invalid discount type: ${tip_type} must be 'tip_percentage' or 'tip_amount'.
    END
    
    # --- Tính toán Subtotal sau discount, Tax, Tip và  Total cuối cùng ---
    ${final_subtotal_after_tip}=    Evaluate    round(${ORIGINAL_TOTAL_SUM} + ${random_tip}, 2)
    Log    ${final_subtotal_after_tip}
    Set Suite Variable    ${TIP_RANDOM}    ${random_tip}
    Set Suite Variable    ${FINAL_TOTAL_AFTER_TIP}    ${final_subtotal_after_tip}

Get value from system and compare with result for Tip
    [Arguments]        ${use_discount}
    IF    ${use_discount} == 'have_discount'
        ## Get value Total Amount
        ${TotalAmount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=3 and @height=37]    name
        ${TotalAmount_system_value}=    Get Amount Value From Service Desc    ${TotalAmount_system}
        ${TotalAmount_system_value}=    Evaluate    f\"{${TotalAmount_system_value}:.2f}\"
        Log    ${TotalAmount_system_value}
        
        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=11]    name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Discount
        ${Discount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=13]    name
        ${Discount_system_value}=    Get Amount Value From Service Desc    ${Discount_system}
        ${Discount_system_value}=    Evaluate    f\"{${Discount_system_value}:.2f}\"
        Log    ${Discount_system_value}

        ## Get value Discounted Subtotal
        ${DiscountedSubtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=15]    name
        ${DiscountedSubtotal_system_value}=    Get Amount Value From Service Desc    ${DiscountedSubtotal_system}
        ${DiscountedSubtotal_system_value}=    Evaluate    f\"{${DiscountedSubtotal_system_value}:.2f}\"
        Log    ${DiscountedSubtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=17]    name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Tip
        ${Tip_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=19]    name
        ${Tip_system_value}=    Get Amount Value From Service Desc    ${Tip_system}
        ${Tip_system_value}=    Evaluate    f\"{${Tip_system_value}:.2f}\"
        Log    ${Tip_system_value}
        
        ## Get value Total
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=21]    name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}
        
        ## Get Tip details
        ${TipDetails_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=1]    name
        ${TipDetails_system_value}=    Get Amount Value From Service Desc    ${TipDetails_system}
        ${TipDetails_system_value}=    Evaluate    f\"{${TipDetails_system_value}:.2f}\"
        Log    ${TipDetails_system_value}
        
        ## So sánh giá trị của Robot Framework VS giá trị của hệ thống
        Should Be Equal As Numbers     ${TotalAmount_system_value}                ${FINAL_TOTAL_AFTER_TIP}            TotalAmount_system_value không khớp với ORIGINAL_TOTAL_SUM
        Should Be Equal As Numbers     ${Subtotal_system_value}                   ${SUBTOTAL_BEFORE_DISCOUNT}         Subtotal_system_value không khớp với SUBTOTAL_BEFORE_DISCOUNT
        Should Be Equal As Numbers     ${Discount_system_value}                   ${ORIGINAL_DISCOUNT_VALUE}          Discount_system_value không khớp với ORIGINAL_DISCOUNT_VALUE
        Should Be Equal As Numbers     ${DiscountedSubtotal_system_value}         ${ORIGINAL_PRICE_SUM}               DiscountedSubtotal_system_value không khớp với ORIGINAL_PRICE_SUM
        Should Be Equal As Numbers     ${Tax_system_value}                        ${ORIGINAL_TAX_SUM}                 Tax_system_value không khớp với ORIGINAL_TAX_SUM
        Should Be Equal As Numbers     ${Tip_system_value}                        ${TIP_RANDOM}                       Tip_system_value không khớp với
        Should Be Equal As Numbers     ${Total_system_value}                      ${FINAL_TOTAL_AFTER_TIP}            Total_system_value không khớp với FINAL_TOTAL_AFTER_TIP
        Should Be Equal As Numbers     ${TipDetails_system_value}                 ${TIP_RANDOM}                       TipDetails_system_value không khớp với TIP_RANDOM
        
    ELSE IF    ${use_discount} == 'no_discount'
        ## Get value Total Amount
        ${TotalAmount_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=3 and @height=37]    name
        ${TotalAmount_system_value}=    Get Amount Value From Service Desc    ${TotalAmount_system}
        ${TotalAmount_system_value}=    Evaluate    f\"{${TotalAmount_system_value}:.2f}\"
        Log    ${TotalAmount_system_value}
        
        ## Get value Subtotal
        ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=11]    name
        ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
        ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
        Log    ${Subtotal_system_value}

        ## Get value Tax
        ${Tax_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=13]    name
        ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
        ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
        Log    ${Tax_system_value}

        ## Get value Tip
        ${Tip_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=15]    name
        ${Tip_system_value}=    Get Amount Value From Service Desc    ${Tip_system}
        ${Tip_system_value}=    Evaluate    f\"{${Tip_system_value}:.2f}\"
        Log    ${Tip_system_value}
        
        ## Get value Total
        ${Total_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[@index=17]    name
        ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
        ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
        Log    ${Total_system_value}
        
        ## Get Tip details
        ${TipDetails_system}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "$") and @index=1]    name
        ${TipDetails_system_value}=    Get Amount Value From Service Desc    ${TipDetails_system}
        ${TipDetails_system_value}=    Evaluate    f\"{${TipDetails_system_value}:.2f}\"
        Log    ${TipDetails_system_value}
        
        ## So sánh giá trị của Robot Framework VS giá trị của hệ thống
        Should Be Equal As Numbers     ${TotalAmount_system_value}         ${FINAL_TOTAL_AFTER_TIP}        TotalAmount_system_value không khớp với ORIGINAL_TOTAL_SUM
        Should Be Equal As Numbers     ${Subtotal_system_value}            ${SUBTOTAL_BEFORE_DISCOUNT}     Subtotal_system_value không khớp với SUBTOTAL_BEFORE_DISCOUNT
        Should Be Equal As Numbers     ${Tax_system_value}                 ${ORIGINAL_TAX_SUM}             Tax_system_value không khớp với ORIGINAL_TAX_SUM
        Should Be Equal As Numbers     ${Tip_system_value}                 ${TIP_RANDOM}                   Tip_system_value không khớp với
        Should Be Equal As Numbers     ${Total_system_value}               ${FINAL_TOTAL_AFTER_TIP}        Total_system_value không khớp với FINAL_TOTAL_AFTER_TIP
        Should Be Equal As Numbers     ${TipDetails_system_value}          ${TIP_RANDOM}                   TipDetails_system_value không khớp với TIP_RANDOM

    ELSE
        Fail    Invalid discount type: ${use_discount} must be 'have_discount' or 'no_discount'.
    END



Get Amount Value From Service Desc
    [Arguments]    ${desc}
    ${lines}=    Split String    ${desc}    \n
    ${amount_str}=    Strip String    ${lines}[-1]
    ${price_match}=    Evaluate    re.findall(r"\\$([0-9]+\\.[0-9]{2})", '''${amount_str}''')    modules=re
    Run Keyword If    ${price_match} == []    Fail    Không tìm thấy giá trong amount: ${amount_str}
    ${price_value}=    Evaluate    float(${price_match[0]})
    RETURN    ${price_value}
