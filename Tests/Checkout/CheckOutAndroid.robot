*** Settings ***
Resource        ../../TestKeyWords/Common.robot
Resource        ../../Resources/Locators/CheckoutLocators.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android

*** Variables ***

${Gift_card}        SGC240940632830
####Gift Card balances may be change with each payment
${Current_amount_Giftcard}        $224.80
*** Test Cases ***
Verify Checkout Credit Card With Voucher Discount And Tip Amount
    [Tags]    checkout    credit_card    voucher_discount    tip_amount
    [Documentation]    Verify Credit Card checkout with a voucher discount and custom tip amount.
    Given Find and choose Technician    caisse
    And Find Categories services    Dip w/ Aloe Vera Manicure
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check balance after apply discount voucher
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $45.00
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check Balance after tips amount
    Then System should still show total amount as    $50.25
    ## Check tip detail 
    And System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card With Voucher Discount And Tip Percentage
    [Tags]    checkout    credit_card    voucher_discount    tip_percentage
    [Documentation]    Verify Credit Card checkout with a voucher discount and tip selected as percentage.
    Given Find and choose Technician    caisse
    And Find Categories services    Dip w/ Aloe Vera Manicure
    And Find Categories services    Gel w/ Regular Mani
    Then System should display original price breakdown    $85.00    $4.25    $89.25
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check balance after apply discount voucher
    Then System should display updated price after discount    -$5.00    $85.00    $4.00    $84.00
    When User proceeds to Payment
    Then System should show balance due    $84.00
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $80.00
    When Choose tip percentage on screen Tips    5%    $4.00
    ## Check Balance after tips percentage
    Then System should still show total amount as    $88.00
    ## Check tip detail
    And System should display tip detail with technician and amount tip    caisse    $4.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount option Apply Voucher without tip
    [Tags]    checkout    credit_card    voucher_discount    no_tip
    [Documentation]    Verify Credit Card checkout with a voucher discount and skip tip, then complete the payment.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check balance after apply discount voucher
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $45.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $47.25
    ## Check tips details
    Then System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt
Verify Checkout Credit Card with Discount Fixed Amount and Tips Amount
    [Tags]    checkout    credit_card    fixed_discount    tip_amount
    [Documentation]    Verify Credit Card checkout with $5 fixed discount and $3 custom tip, then complete the payment.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Gel w/ Regular Mani
    Then System should display original price breakdown    $85.00    $4.25    $89.25
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply discount fixed amount
    Then System should display updated price after discount    -$5.00    $85.00    $4.00    $84.00
    When User proceeds to Payment
    Then System should show balance due    $84.00
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $80.00
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check Balance after tips amount
    Then System should still show total amount as    $87.00
    ## Check tips details
    Then System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount Fixed Amount and Tips Percentage
    [Tags]    checkout    credit_card    fixed_discount    tip_percentage
    [Documentation]    Verify Credit Card checkout with $5 fixed discount and 5% tip selected, then complete the payment.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Gel w/ Regular Mani
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown        $135.00    $6.75    $141.75
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply discount fixed amount
    Then System should display updated price after discount    -$5.00    $135.00    $6.50    $136.50
    When User proceeds to Payment
    Then System should show balance due    $136.50
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $130.00
    When Choose tip percentage on screen Tips    5%    $6.50
    ## Check balance after tip percentage
    Then System should still show total amount as    $143.00
    ## Check tip details
    Then System should display tip detail with technician and amount tip    caisse    $6.50
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount Percentage and Tips Percentage
    [Tags]    checkout    credit_card    percentage_discount    tip_percentage
    [Documentation]    Verify Credit Card checkout with 10% discount applied and 5% tip selected, then complete the payment.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Gel w/ Regular Mani
    Then System should display original price breakdown    $85.00    $4.25    $89.25
    When Apply Percentage Discount    1    0
    ## Check balance after apply discount percentage
    Then System should display updated price after discount      -$8.50    $85.00    $3.83    $80.33 
    When User proceeds to Payment
    Then System should show balance due    $80.33
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount    $76.50
    When Choose tip percentage on screen Tips    5%    $3.82
    ## Check balance after tips percentage
    Then System should still show total amount as    $84.15
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $3.82
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount Percentage and Tips Amount
    [Tags]    checkout    credit_card    percentage_discount    custom_tip
    [Documentation]    Verify Credit Card checkout with percentage discount applied, add custom tip amount, and complete payment.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Gel w/ Regular Mani
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $135.00    $6.75    $141.75
    When Apply Percentage Discount    1    0
    ## Check balance after apply discount percentage
    Then System should display updated price after discount    -$13.50    $135.00    $6.08    $127.58
    When User proceeds to Payment
    Then System should show balance due    $127.58
    When User selects payment method as Credit Card
    ## Check display total tips amount
    Then System should display tip screen with default tip amount     $121.50
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check balance after apply tips amount
    Then System should still show total amount as         $130.58
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount option Fixed Amount without tip and send receipt to Sms
    [Tags]    checkout    credit_card    fixed_discount    no_tip    send_receipt_sms
    [Documentation]    Verify Credit Card checkout with fixed discount applied, skip tip, and send receipt to SMS.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Crystal Nails
    Then System should display original price breakdown    $58.00    $2.90    $60.90
    When Apply Fixed Discount    5    0    0
    ## Check Balance after apply Fixed discount
    Then System should display updated price after discount    -$5.00    $58.00    $2.65    $55.65
    When User proceeds to Payment
    Then System should show balance due    $55.65
    When User selects payment method as Credit Card
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $53.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $55.65
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    ## Check display notify message on screen
    Then System should display notify message as    The receipt has been sent successfully.
    When Choose No Receipt

Verify Checkout Credit Card with Discount option Percentage without tip and send receipt to Email
    [Tags]    checkout    credit_card    percentage_discount    no_tip    send_receipt
    [Documentation]    Verify Credit Card checkout with percentage discount applied, skip tip, and send receipt to email.
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Dip Ombre
    Then System should display original price breakdown    $100.00    $5.00    $105.00
    When Apply Percentage Discount    1    0
    ## Check Balance after apply percentage discount
    Then System should display updated price after discount    -$10.00    $100.00    $4.50    $94.50 
    When User proceeds to Payment
    Then System should show balance due    $94.50
    When User selects payment method as Credit Card
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $90.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $94.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    When Sign And Confirm Payment
    ## Check display text on screen
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    ## Check display notify message on screen
    Then System should display notify message as     Send Receipt Successfully
    When Choose No Receipt

Verify Checkout Credit Card without discount and without tip
    [Tags]    checkout    credit_card    no_discount    no_tip    success
    [Documentation]    Verify the checkout flow using Credit Card without any discount and skipping tip.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    And Find Categories services      Gel w/ Regular Mani
    Then System should display original price breakdown    $85.00    $4.25    $89.25
    When User proceeds to Payment
    Then System should show balance due    $89.25
    When User selects payment method as Credit Card
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $85.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $89.25
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message on screen
    Then System should display notify message as     Proceed payment successfully
    # And Click on Element mobile    ${elm_btn_Done}
    # Then Check validation error message Android      //android.view.View[@content-desc="Signature is empty"]             Signature is empty
    When Sign And Confirm Payment
    ## Check display text on screen
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt
#    
##Method Giftcard
Validate Checkout Giftcard Not Found
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then System should display original price breakdown    $8.00    $0.40   $8.40   
    When User proceeds to Payment
    And User selects payment method as Gift Card
    When Pay By Gift Card    SGC8891M1
    Then System should display text on screen as        Gift Card Not Found

Validate Checkout Giftcard Expired
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC8891M1
    And Pay By Gift Card    SGC240954437458
    Then System should display text on screen as       Gift card has been expired.

Verify Checkout Giftcard Deactivated 
    ##Waiting Dev fix validation text
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC240954437458
    And Pay By Gift Card    SGC240961690283 
    Then System should display text on screen as        The gift card has been deactivated

Verify Checkout Giftcard Not Enough Amount 
    Given User at screen Enter Gift Card Code  
    When Click And Clear Field    SGC240961690283
    And Pay By Gift Card    SGC240950990238
    Then System should display text on screen as    The gift card amount is not enough to use.
Verify Checkout Giftcard
    Given User at screen Enter Gift Card Code
    When Click And Clear Field    SGC240950990238
    And Pay By Gift Card    ${Gift_card}
    ## Check Gift Card Code
    # Then Check validation error message Android    //android.view.View[@content-desc="SGC240940632830"]    ${Gift_card}
    ## Check Current Amount of Gift card
    # And Check validation error message Android    //android.view.View[@content-desc="${Current_amount_Giftcard}"]    ${Current_amount_Giftcard}
    ## Check Apply Amount Gift Card
    # Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$8.40"])[4]    $8.40
    And User clicks Submit button
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    Then System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Giftcard and Send email
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then System should display original price breakdown    $8.00    $0.40    $8.40
    When User proceeds to Payment
    And User selects payment method as Gift Card
    When Pay By Gift Card     ${Gift_card}
    And User clicks Submit button
    Then System should display notify message as     Proceed payment successfully
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display notify message as     Send Receipt Successfully
    When Choose No Receipt

Verify Checkout Giftcard and Send SMS
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then System should display original price breakdown    $8.00    $0.40    $8.40
    When User proceeds to Payment
    And User selects payment method as Gift Card
    When Pay By Gift Card       ${Gift_card}
    And User clicks Submit button
    Then System should display notify message as     Proceed payment successfully
    Then System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then System should display notify message as    The receipt has been sent successfully.
    When Choose No Receipt

# ##Method Paid Externally
Verify Checkout Paid Externally Apply Voucher and without tip
    [Tags]    checkout    voucher    payment    external    no_tip
    [Documentation]    Verify full checkout flow with voucher applied, no tip, and paid externally
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check Balance after apply voucher
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    When User Skips Tip
    ## Check Balance after skip tips
    Then System should still show total amount as    $47.25
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip custom amount
    [Tags]    checkout    voucher    payment    external    tip    custom
    [Documentation]    Verify full checkout flow with voucher applied, tip custom amount, and paid externally
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check Balance after apply voucher
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check Balance after tips amount
    Then System should still show total amount as    $50.25
    ## Check tip details
    Then System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip percentage
    [Tags]    checkout    voucher    payment    external    tip    percentage
    [Documentation]    Verify full checkout flow with voucher applied, tip percentage, and paid externally
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Voucher Discount    Testvoucher
    And User clicks Submit button
    ## Check Balance after apply voucher
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    ## Check balance after tip percentage
    When Choose tip percentage on screen Tips    5%    $2.25
    Then System should still show total amount as    $49.50
    ## Check tip details
    Then System should display tip detail with technician and amount tip    caisse    $2.25
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

# # Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
# Verify Checkout Paid Externally Maximum Discount Amount with Option Apply Voucher
#     [Tags]    voucher    max_discount    positive
#     [Documentation]    Verify system applies only the maximum allowed discount amount
#     Given Find and choose Technician    caisse
#     And Find Categories services      Acrylic Full Set w/ Gel
#     And Find Categories services      Dip w/ Aloe Vera Manicure
#     Then Check validation error message Android    //android.view.View[@content-desc="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@content-desc="$5.00"]    $5.00
#     And Check validation error message Android    //android.view.View[@content-desc="$105.00"]    $105.00
#     When Apply Voucher Discount    maximumdiscount
#     And Click on Element mobile    ${elm_btn_Submit}
#     Then Check validation error message Android    //android.view.View[@content-desc="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@content-desc="$4.50"]    $4.50
#     And Check validation error message Android    //android.view.View[@content-desc="$94.50"]    $94.50
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$94.50"])[3]    $94.50
#     And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
#     ##Tips total amount
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$90.00"])[1]    $90.00
#     When Click on Element mobile    ${elm_btn_Skip}
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$90.00"])[1]    $90.00
#     And Click on Element mobile    ${elm_btn_BeginCharge}
    
#     Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt
    
Verify Checkout Paid Externally without discount and without tip
    [Tags]    checkout    no_voucher    no_tip    external_payment    success
    [Documentation]    Verify full checkout flow without any voucher or tip applied,
    ...    paid externally, and ensure total amount remains unchanged with confirmation displayed.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When User proceeds to Payment
    Then System should show balance due    $52.50
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $50.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $52.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally without discount and without tip and send Email
    [Tags]    checkout    no_voucher    no_tip    external_payment    send_email    success
    [Documentation]    Verify full checkout flow without voucher and tip, using external payment,
    ...    and sending receipt to email successfully, followed by choosing no printed receipt.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When User proceeds to Payment
    Then System should show balance due    $52.50
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $50.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $52.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then System should display text on screen as    Send Receipt Successfully
    When Choose No Receipt

Verify Checkout Paid Externally without discount and without tip and send Sms
    [Tags]    checkout    no_voucher    no_tip    external_payment    send_sms    success
    [Documentation]    Verify full checkout flow without voucher and tip, using external payment,
    ...    and sending receipt via SMS successfully, followed by choosing no printed receipt.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When User proceeds to Payment
    Then System should show balance due    $52.50
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $50.00
    When User Skips Tip
    ## Check balance after skip tip
    Then System should still show total amount as    $52.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then System should display text on screen as    The receipt has been sent successfully.
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and without tip
    [Tags]    checkout    percentage_discount    no_tip    external_payment    success
    [Documentation]    Verify checkout flow with 10% percentage discount applied, no tip selected,
    ...    using external payment, and ensuring price updates and confirmation display correctly.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Percentage Discount    1    0
    ## Check Balance after apply percentage discount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    ## Check balance after Skip tip
    When User Skips Tip
    Then System should still show total amount as    $47.25
    ## Check tip details
    Then System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip percentage
    [Tags]    checkout    paid_externally    percentage_discount    tip_percentage    success
    [Documentation]    Verify the checkout flow when applying a 10% percentage discount and a 5% tip. 
    ...    Ensure the system calculates discount and tip correctly, and completes external payment with confirmation.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Percentage Discount    1    0
    ## Check Balance after apply percentage discount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    ## Check balance after tip percentage
    When Choose tip percentage on screen Tips    5%    $2.25
    Then System should still show total amount as    $49.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $2.25
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip custom amount
    [Tags]    checkout    paid_externally    percentage_discount    custom_tip    success
    [Documentation]    Verify the checkout flow when applying a 10% percentage discount and a custom tip amount.
    ...    Ensure the system calculates the discount and custom tip correctly, and completes external payment flow.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Percentage Discount    1    0
    ## Check Balance after apply percentage discount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check balance after apply tips amount
    Then System should still show total amount as         $50.25
    ## Check tips details
    Then System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and without tip
    [Tags]    checkout    paid_externally    fixed_discount    no_tip    success
    [Documentation]    Verify the checkout flow when applying a fixed discount amount ($5.00) and skipping tip.
    ...    Ensure the system correctly calculates new total, handles external payment, and skips tip successfully.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply discount fixed amount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    ## Check balance after Skip tip
    When User Skips Tip
    Then System should still show total amount as    $47.25
    ## Check tip details
    Then System should display tip detail with technician and amount tip    caisse    $0.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip custom amount
    [Tags]    checkout    paid_externally    fixed_discount    custom_tip    success
    [Documentation]    Verify the checkout flow with fixed discount ($5.00) and custom tip ($3.00) using Paid Externally method.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply discount fixed amount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    When User selects Custom Tip option
    And Enter NumberPad Amount    3    0    0
    And User clicks Submit button
    ## Check balance after apply tips amount
    Then System should still show total amount as         $50.25
    ## Check tips details
    And System should display tip detail with technician and amount tip    caisse    $3.00
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip percentage
    [Tags]    checkout    paid_externally    fixed_discount    tip_percentage    success
    [Documentation]    Verify the checkout flow with fixed discount ($5.00) and tip 5% using Paid Externally method.
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then System should display original price breakdown    $50.00    $2.50    $52.50
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply discount fixed amount
    Then System should display updated price after discount    -$5.00    $50.00    $2.25    $47.25 
    When User proceeds to Payment
    Then System should show balance due    $47.25
    When User selects payment method as Paid Externally
    ## Check display Tips total amount
    Then System should display tip screen with default tip amount    $45.00
    ## Check balance after tip percentage
    When Choose tip percentage on screen Tips    5%    $2.25
    Then System should still show total amount as    $49.50
    ## Check tip details
    And System should display tip detail with technician and amount tip    caisse    $2.25
    When User Begins Charge
    ## Check display notify message and text on screen
    Then System should display notify message as     Proceed payment successfully
    And System should display text on screen as     Your payment is confirmed!
    When Choose No Receipt
##Method Paid Externally

##Method Cash
Verify Check out Cash
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    And Find Categories services      Swedish Massage
    Then Check validation error message Android    //android.view.View[@content-desc="$83.00"]    $83.00
    And Check validation error message Android    //android.view.View[@content-desc="$4.15"]    $4.15
    And Check validation error message Android    //android.view.View[@content-desc="$87.15"]        $87.15
    When Click on Element mobile    //android.widget.EditText
    And Fill Text Input mobile      //android.widget.EditText    Royal Pedicure
    And Click on Element mobile     //android.view.View[@content-desc="Change position"]
    And Click on Element mobile     //android.view.View[contains(@content-desc, "Royal Pedicure") and contains(@content-desc, "$45.00")]
    Then Check validation error message Android    //android.view.View[@content-desc="$128.00"]    $128.00
    And Check validation error message Android    //android.view.View[@content-desc="$6.40"]    $6.40
    And Check validation error message Android    //android.view.View[@content-desc="$134.40"]        $134.40
    When Pay By Cash
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Check out Cash and send email
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Cash
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose send receipt to Email    school@yopmail.com
    Then Check validation error message Android    //android.view.View[@content-desc="Send Receipt Successfully"]    Send Receipt Successfully
    When Choose No Receipt

Verify Check out Cash and send Sms
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Cash
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose send receipt to SMS      8    0    4    2    8    6    0    4    3    9
    Then Check validation error message Android    //android.view.View[@content-desc="The receipt has been sent successfully."]    The receipt has been sent successfully.
    When Choose No Receipt
    

Verify Checkout Cash many times
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    And Find Categories services      Gel w/ Regular Mani
    Then Check validation error message Android          //android.view.View[@content-desc="$85.00"]         $85.00
    And Check validation error message Android          //android.view.View[@content-desc="$4.25"]         $4.25
    And Check validation error message Android          //android.view.View[@content-desc="$89.25"]         $89.25
    When Click on Element mobile    ${elm_btn_Payment}
    And Click on Element mobile     //android.view.View[@content-desc="Clear"]
    And Enter NumberPad Amount    2    0    0    0
    And Click on Element mobile    ${elm_Option_Cash}
    Then Check validation error message Android    //android.view.View[@content-desc="$69.25"]    $69.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Balance due $69.25"]    Balance due $69.25
    When Choose No Receipt
    And Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    And Click on Element mobile    //android.view.View[@content-desc="Clear"]
    And Enter NumberPad Amount    2    0    0    0
    And Click on Element mobile    ${elm_Option_Cash}
    Then Check validation error message Android    //android.view.View[@content-desc="$49.25"]    $49.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Balance due $49.25"]    Balance due $49.25
    When Choose No Receipt
    And Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    And Click on Element mobile    //android.view.View[@content-desc="Clear"]
    And Enter NumberPad Amount    4    9    2    5
    And Click on Element mobile    ${elm_Option_Cash}
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Cash with discount percentage
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Percentage Discount    1    0
    ## Check balance after apply discount percentage
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    ${elm_Option_Cash}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Cash with discount fixed amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Fixed Discount    5    0    0
    ## Check balance after apply fixed amount
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    ${elm_Option_Cash}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout with Option Apply Voucher expired
    Given Find and choose Technician    caisse
    And Find Categories services      Gel w/ Regular Mani
    Then Check validation error message Android          //android.view.View[@content-desc="$35.00"]         $35.00
    And Check validation error message Android          //android.view.View[@content-desc="$1.75"]         $1.75
    And Check validation error message Android          //android.view.View[@content-desc="$36.75"]         $36.75
    When Apply Voucher Discount    expired
    Then Check validation error message Android         //android.view.View[@content-desc="The voucher has been expired!"]        The voucher has been expired!

# Test Case: Validate Limit Per Voucher (Usage Exceeded)
Validate Limit Per Voucher (Usage Exceeded) with Option Apply Voucher
    [Tags]    voucher    limit    negative
    [Documentation]    Verify error when voucher usage exceeds allowed limit
    Given User at screen enter voucher code
    When Click And Clear Field    expired
    And Apply Voucher Discount    usageexceeded
    Then Check validation error message Android    //android.view.View[@content-desc="Voucher has reached its usage limit."]    Voucher has reached its usage limit.

# Test Case: Validate Limit Per User (User Limit Exceeded)
Validate Limit Per User (User Limit Exceeded) with Option Apply Voucher
    [Tags]    voucher    user_limit    negative
    [Documentation]    Verify error when user exceeds allowed voucher usage
    Given User at screen enter voucher code
    When Click And Clear Field    usageexceeded
    And Apply Voucher Discount    userlimitexceeded
    Then Check validation error message Android    //android.view.View[@content-desc="Voucher has reached its usage limit."]    Voucher has reached its usage limit.

# Test Case: Validate Minimum Spend Requirement
Validate Minimum Spend Requirement with Option Apply Voucher
    [Tags]    voucher    min_spend    negative
    [Documentation]    Verify error when order total is less than voucher minimum spend
    Given User at screen enter voucher code
    When Click And Clear Field    usageexceeded
    And Apply Voucher Discount    minimumspend50
    Then Check validation error message Android    //android.view.View[@content-desc="The minimum spent required to apply this voucher is $50.00"]    The minimum spent required to apply this voucher is $50.00

# Verify Checkout Cash with Option Apply Voucher -> Dev inprogress fixing
#     Given User at screen enter voucher code
#     When Click on Element mobile        //android.view.View[@content-desc="Cancel"]
#     When Find Categories services      Gel w/ Regular Mani
#     Then Check validation error message Android          //android.view.View[@content-desc="$70.00"]        $70.00
#     Then Check validation error message Android          //android.view.View[@content-desc="$3.50"]         $3.50
#     Then Check validation error message Android          //android.view.View[@content-desc="$73.50"]         $73.50
#     When Apply Voucher Discount    Testvoucher
#     When Click on Element mobile    ${elm_btn_Submit}
#     Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
#     And Click on Element mobile    ${elm_Option_Cash}
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
#     And Click on Element mobile    ${elm_btn_BeginCharge}
#     Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt

# Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
# Verify Checkout Maximum Discount Amount with Option Apply Voucher
#     [Tags]    voucher    max_discount    positive
#     [Documentation]    Verify system applies only the maximum allowed discount amount
#     Given Find and choose Technician    caisse
#     And Find Categories services      Acrylic Full Set w/ Gel
#     And Find Categories services      Dip w/ Aloe Vera Manicure
#     Then Check validation error message Android    //android.view.View[@content-desc="$100.00"]    $100.00
#     And Check validation error message Android    //android.view.View[@content-desc="$5.00"]    $5.00
#     And Check validation error message Android    //android.view.View[@content-desc="$105.00"]    $105.00
#     When Apply Voucher Discount    maximumdiscount
#     Then Check validation error message Android    //android.view.View[@content-desc="$95.00"]    $95.00
#     And Check validation error message Android    //android.view.View[@content-desc="$4.75"]    $4.75
#     And Check validation error message Android    //android.view.View[@content-desc="$99.75"]    $99.75
#     When Click on Element mobile    ${elm_btn_Payment}
#     Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[3]    $99.75
#     And Click on Element mobile    ${elm_Option_Cash}
#     Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[1]    $99.75
#     And Click on Element mobile    ${elm_btn_BeginCharge}
#     Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
#     When Choose No Receipt


# ##Method Cash

*** Keywords ***
User at screen Enter Gift Card Code
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[@content-desc="Gift Card"]        10s

User at screen enter voucher code
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[@content-desc="Voucher Code"]       10s

System should display original price breakdown
    [Arguments]    ${price}    ${tax}    ${total}
    Check validation error message Android    //android.view.View[@content-desc="${price}"]    ${price}
    Check validation error message Android    //android.view.View[@content-desc="${tax}"]    ${tax}
    Check validation error message Android    //android.view.View[@content-desc="${total}"]    ${total}

System should display updated price after discount
    [Arguments]    ${discount}    ${price}    ${tax}    ${total}
    Check validation error message Android    xpath=(//android.view.View[@content-desc="${discount}"])[1]    ${discount}
    Check validation error message Android    //android.view.View[@content-desc="${price}"]    ${price}
    Check validation error message Android    //android.view.View[@content-desc="${tax}"]    ${tax}
    Check validation error message Android    //android.view.View[@content-desc="${total}"]    ${total}

System should show balance due 
    [Arguments]    ${amount}
    Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Check validation error message Android    xpath=(//android.view.View[@content-desc="${amount}"])[3]    ${amount}

System should display tip screen with default tip amount
    [Arguments]    ${amount}
    Check validation error message Android    //android.view.View[@content-desc="${amount}"]    ${amount}

System should still show total amount as
    [Arguments]    ${amount}
    Check validation error message Android    xpath=(//android.view.View[@content-desc="${amount}"])[1]    ${amount}

System should display notify message as
    [Arguments]    ${message}
    Check validation error message Android    //android.view.View[@content-desc="${message}"]        ${message}

System should display text on screen as
    [Arguments]    ${text}
    Check validation error message Android    //android.view.View[@content-desc="${text}"]        ${text}

System should display tip detail with technician and amount tip
    [Arguments]    ${technician}    ${tip}
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@content-desc, "${technician}") and contains(@content-desc, "${tip}")]    10s
    ${desc}=    AppiumLibrary.Get Element Attribute    //android.view.View[contains(@content-desc, "${technician}") and contains(@content-desc, "${tip}")]    content-desc
    Should Contain    ${desc}    ${technician}
    Should Contain    ${desc}    ${tip}

User proceeds to Payment
    Click on Element mobile    ${elm_btn_Payment}

User clicks Submit button
    Click on Element mobile    ${elm_btn_Submit}

User Skips Tip
    Click on Element mobile    ${elm_btn_Skip}   

User Begins Charge
    Click on Element mobile    ${elm_btn_BeginCharge}

User selects Custom Tip option
    Click on Element mobile    ${elm_Option_CustomAmount}


## Method Payment
User selects payment method as Cash
    Click on Element mobile    ${elm_Option_Cash}

User selects payment method as Paid Externally
    Click on Element mobile    ${elm_Method_PaidExternally}

User selects payment method as Gift Card
    Click on Element mobile    ${elm_Method_GiftCard}

User selects payment method as Credit Card
    Click on Element mobile    ${elm_Method_CreditCard}
## Method Payment

## Apply Discount
Apply Fixed Discount
    [Arguments]    @{amount}
    Click on Element mobile    //android.view.View[@content-desc="Discount" and @clickable="true"]
    Click on Element mobile    //android.view.View[@content-desc="Quick discount"]/android.view.View
    Click on Element mobile    //android.view.View[@content-desc="Fixed amount"]
    Click on Element mobile    //android.view.View[@content-desc="Select Discount"]/android.view.View[2]/android.view.View[4]/android.view.View
    FOR    ${digit}    IN    @{amount}
        Click on Element mobile    //android.view.View[@content-desc="${digit}"]
    END
    Click on Element mobile    ${elm_btn_Done}
    Click on Element mobile    ${elm_btn_Submit}

Apply Percentage Discount
    [Arguments]    @{percent}
    Click on Element mobile    //android.view.View[@content-desc="Discount" and @clickable="true"]
    Click on Element mobile    //android.view.View[@content-desc="Quick discount"]/android.view.View
    Click on Element mobile    //android.view.View[@content-desc="Select Discount"]/android.view.View[2]/android.view.View[6]/android.view.View
    FOR    ${digit}    IN    @{percent}
        Click on Element mobile    //android.view.View[@content-desc="${digit}"]
    END
    Click on Element mobile    ${elm_btn_Done}
    Click on Element mobile    ${elm_btn_Submit}

Apply Voucher Discount
    [Arguments]    ${voucher_code}
    Click on Element mobile    //android.view.View[@content-desc="Discount" and @clickable="true"]
    Click on Element mobile    //android.view.View[@content-desc="Apply Voucher"]
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile     //android.widget.EditText    ${voucher_code}
    Click on Element mobile    //android.view.View[contains(@content-desc, "Code: #SBV${voucher_code}")]
## Apply Discount    

Pay By Gift Card
    [Arguments]    ${gift_card}
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile    //android.widget.EditText    ${gift_card}
    Click on Element mobile    //android.view.View[@content-desc="Apply"]

Pay By Cash
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    ${elm_Option_Cash}
    Click on Element mobile    ${elm_btn_BeginCharge}


Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}"]
    END

Choose tip percentage on screen Tips
    [Arguments]    ${percent}    ${amount}
    Click on Element mobile    //android.view.View[contains(@content-desc, "${percent}") and contains(@content-desc, "${amount}")]

Sign And Confirm Payment
    Swipe    600    300    1250    300
    Swipe    928    300    918    750
    Click on Element mobile    ${elm_btn_Done}

Choose No Receipt
    Click on Element mobile    ${elm_Option_NoReceipt}

Choose send receipt to Email
    [Arguments]    ${email}
    Click on Element mobile    //android.view.View[@content-desc="Email"]
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile     //android.widget.EditText    ${email}
    Click on Element mobile    //android.widget.ScrollView/android.view.View[7]
    Click on Element mobile    //android.widget.EditText[@text="${email}"]/android.view.View
    Click on Element mobile    //android.view.View[@content-desc="SEND"]

Choose send receipt to SMS    
    [Arguments]    @{digits}
    Click on Element mobile    //android.view.View[@content-desc="Text (SMS)"]
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}"]
    END

    Click on Element mobile    //android.view.View[@content-desc="Send"]