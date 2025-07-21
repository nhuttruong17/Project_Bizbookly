*** Settings ***
Resource        ../../TestKeyWords/Common.robot
Resource        ../../Resources/Locators/CheckoutLocators.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android


Library    OperatingSystem

*** Variables ***

${Gift_card}        SGC240940632830
####Gift Card balances may be change with each payment
${Current_amount_Giftcard}        $224.80
*** Test Cases ***
Verify Checkout Credit Card with Discount option Apply Voucher
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    When Apply Voucher Discount    Testvoucher
    And Click on Element mobile    ${elm_btn_Submit}
    # Thêm các bước kiểm tra kết quả, thanh toán, ký tên, nhận receipt nếu cần
    When Pay By Credit Card
    Then AppiumLibrary.Wait Until Element Is Visible    //android.view.View[@content-desc="Proceed payment successfully"]        10s
    When Sign And Confirm Payment
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt


Verify Checkout Credit Card with Discount option Fixed Amount
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Fixed Discount    5    0    0
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    And Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    And Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Pay By Credit Card
    Then AppiumLibrary.Wait Until Element Is Visible    //android.view.View[@content-desc="Proceed payment successfully"]        10s
    When Sign And Confirm Payment
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]       Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card with Discount option Percentage
    Given Find and choose Technician    caisse
    And Find Categories services      Dip w/ Aloe Vera Manicure
    And Find Categories services      Dip Ombre
    Then Check validation error message Android          //android.view.View[@content-desc="$100.00"]        $100.00
    And Check validation error message Android          //android.view.View[@content-desc="$5.00"]         $5.00
    And Check validation error message Android          //android.view.View[@content-desc="$105.00"]         $105.00
    When Apply Percentage Discount    1    0
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$10.00"])[1]    -$10.00
    And Check validation error message Android          //android.view.View[@content-desc="$100.00"]        $100.00
    And Check validation error message Android          //android.view.View[@content-desc="$4.50"]         $4.50
    And Check validation error message Android          //android.view.View[@content-desc="$94.50"]         $94.50
    When Pay By Credit Card
    Then AppiumLibrary.Wait Until Element Is Visible    //android.view.View[@content-desc="Proceed payment successfully"]        10s
    When Sign And Confirm Payment
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]       Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Credit Card without discount and without tip
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    And Find Categories services      Gel w/ Regular Mani
    Then Check validation error message Android          //android.view.View[@content-desc="$85.00"]         $85.00
    And Check validation error message Android          //android.view.View[@content-desc="$4.25"]         $4.25
    And Check validation error message Android          //android.view.View[@content-desc="$89.25"]         $89.25
    When Pay By Credit Card
    And Click on Element mobile    ${elm_btn_Done}
    Then Check validation error message Android      //android.view.View[@content-desc="Signature is empty"]             Signature is empty
    When Sign And Confirm Payment
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]       Your payment is confirmed!
    When Choose No Receipt

##Method Giftcard
Validate Checkout Giftcard Not Found
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Gift Card    SGC8891M1
    Then Check validation error message Android    //android.view.View[@content-desc="Gift Card Not Found"]    Gift Card Not Found

Validate Checkout Giftcard Expired
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Gift Card    SGC240954437458
    Then Check validation error message Android    //android.view.View[@content-desc="Gift card has been expired."]    Gift card has been expired.
    

Verify Checkout Giftcard
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Gift Card    ${Gift_card}
    And Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    //android.view.View[@content-desc="SGC240940632830"]    ${Gift_card}
    And Check validation error message Android    //android.view.View[@content-desc="${Current_amount_Giftcard}"]    ${Current_amount_Giftcard}
    And Check validation error message Android    xpath=(//android.view.View[@content-desc="$8.40"])[4]    $8.40
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]       Your payment is confirmed!
    When Choose No Receipt

##Method Paid Externally
Verify Checkout Paid Externally Apply Voucher and without tip
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Voucher Discount    Testvoucher
    When Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$5.00"])[1]    -$5.00
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    Then Check validation error message Android    //android.view.View[@content-desc="$2.25"]    $2.25
    Then Check validation error message Android    //android.view.View[@content-desc="$47.25"]    $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    ${elm_btn_Skip}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip custom amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Voucher Discount    Testvoucher
    When Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$5.00"])[1]    -$5.00
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    Then Check validation error message Android    //android.view.View[@content-desc="$2.25"]    $2.25
    Then Check validation error message Android    //android.view.View[@content-desc="$47.25"]    $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[@content-desc="Custom Amount"]
    When Enter NumberPad Amount    3    0    0
    And Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$50.25"])[1]    $50.25
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$3.00")]    $3.00
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally Apply Voucher and tip percentage
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Voucher Discount    Testvoucher
    When Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$5.00"])[1]    -$5.00
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    Then Check validation error message Android    //android.view.View[@content-desc="$2.25"]    $2.25
    Then Check validation error message Android    //android.view.View[@content-desc="$47.25"]    $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[contains(@content-desc, "5%") and contains(@content-desc, "$2.25")]
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$49.50"])[1]    $49.50
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$2.25")]    $2.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

# Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
Verify Checkout Paid Externally Maximum Discount Amount with Option Apply Voucher
    [Tags]    voucher    max_discount    positive
    [Documentation]    Verify system applies only the maximum allowed discount amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    And Find Categories services      Dip w/ Aloe Vera Manicure
    Then Check validation error message Android    //android.view.View[@content-desc="$100.00"]    $100.00
    And Check validation error message Android    //android.view.View[@content-desc="$5.00"]    $5.00
    And Check validation error message Android    //android.view.View[@content-desc="$105.00"]    $105.00
    When Apply Voucher Discount    maximumdiscount
    Then Check validation error message Android    //android.view.View[@content-desc="$95.00"]    $95.00
    And Check validation error message Android    //android.view.View[@content-desc="$4.75"]    $4.75
    And Check validation error message Android    //android.view.View[@content-desc="$99.75"]    $99.75
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[3]    $99.75
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[1]    $99.75
    And Click on Element mobile    ${elm_btn_BeginCharge}
    And Click on Element mobile    ${elm_btn_Skip}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt
    
Verify Checkout Paid Externally without discount and without tip
    Given Find and choose Technician    caisse
    And Find Categories services      Crystal Nails
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$8.00"])[2]         $8.00
    And Check validation error message Android          //android.view.View[@content-desc="$0.40"]         $0.40
    And Check validation error message Android          //android.view.View[@content-desc="$8.40"]         $8.40
    When Pay By Paid Externally
    Then Check validation error message Android    //android.view.View[@content-desc="Paid Externally"]    Paid Externally
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]       Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and without tip
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Percentage Discount    1    0
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    ${elm_btn_Skip}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip percentage
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Percentage Discount    1    0
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[contains(@content-desc, "5%") and contains(@content-desc, "$2.25")]
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$49.50"])[1]    $49.50
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$2.25")]    $2.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount percentage and tip custom amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Percentage Discount    1    0
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[@content-desc="Custom Amount"]
    When Enter NumberPad Amount    3    0    0
    And Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$50.25"])[1]    $50.25
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$3.00")]    $3.00
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and without tip
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Fixed Discount    5    0    0
    Then Check validation error message Android         xpath=(//android.view.View[@content-desc="-$5.00"])[1]        -$5.00
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]        $50.00
    Then Check validation error message Android          //android.view.View[@content-desc="$2.25"]         $2.25
    Then Check validation error message Android          //android.view.View[@content-desc="$47.25"]         $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    ${elm_btn_Skip}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$47.25"])[1]    $47.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip custom amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Fixed Discount    5    0    0
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$5.00"])[1]    -$5.00
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    Then Check validation error message Android    //android.view.View[@content-desc="$2.25"]    $2.25
    Then Check validation error message Android    //android.view.View[@content-desc="$47.25"]    $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[@content-desc="Custom Amount"]
    When Enter NumberPad Amount    3    0    0
    And Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$50.25"])[1]    $50.25
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$3.00")]    $3.00
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

Verify Checkout Paid Externally discount fixed amount and tip percentage
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Fixed Discount    5    0    0
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="-$5.00"])[1]    -$5.00
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    Then Check validation error message Android    //android.view.View[@content-desc="$2.25"]    $2.25
    Then Check validation error message Android    //android.view.View[@content-desc="$47.25"]    $47.25
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android    //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$47.25"])[3]    $47.25
    And Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    And Click on Element mobile    //android.view.View[contains(@content-desc, "5%") and contains(@content-desc, "$2.25")]
    Then Check validation error message Android    xpath=(//android.view.View[@content-desc="$49.50"])[1]    $49.50
    Then Should Contain    //android.view.View[contains(@content-desc, "caisse") and contains(@content-desc, "$2.25")]    $2.25
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
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
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Voucher Discount    expired
    And Click on Element mobile    ${elm_btn_Submit}
    Then Check validation error message Android         //android.view.View[@content-desc="The voucher has been expired!"]        The voucher has been expired!

Verify Checkout Cash with Option Apply Voucher
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android          //android.view.View[@content-desc="$50.00"]         $50.00
    And Check validation error message Android          //android.view.View[@content-desc="$2.50"]         $2.50
    And Check validation error message Android          //android.view.View[@content-desc="$52.50"]         $52.50
    When Apply Voucher Discount    Testvoucher
    When Click on Element mobile    ${elm_btn_Submit}
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

# Test Case: Validate Maximum Discount Amount : Dev inprogress fixing
Verify Checkout Maximum Discount Amount with Option Apply Voucher
    [Tags]    voucher    max_discount    positive
    [Documentation]    Verify system applies only the maximum allowed discount amount
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    And Find Categories services      Dip w/ Aloe Vera Manicure
    Then Check validation error message Android    //android.view.View[@content-desc="$100.00"]    $100.00
    And Check validation error message Android    //android.view.View[@content-desc="$5.00"]    $5.00
    And Check validation error message Android    //android.view.View[@content-desc="$105.00"]    $105.00
    When Apply Voucher Discount    maximumdiscount
    Then Check validation error message Android    //android.view.View[@content-desc="$95.00"]    $95.00
    And Check validation error message Android    //android.view.View[@content-desc="$4.75"]    $4.75
    And Check validation error message Android    //android.view.View[@content-desc="$99.75"]    $99.75
    When Click on Element mobile    ${elm_btn_Payment}
    Then Check validation error message Android          //android.view.View[@content-desc="BALANCE DUE"]    BALANCE DUE
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[3]    $99.75
    And Click on Element mobile    ${elm_Option_Cash}
    Then Check validation error message Android          xpath=(//android.view.View[@content-desc="$99.75"])[1]    $99.75
    And Click on Element mobile    ${elm_btn_BeginCharge}
    Then Check validation error message Android    //android.view.View[@content-desc="Your payment is confirmed!"]    Your payment is confirmed!
    When Choose No Receipt

# Test Case: Validate Limit Per Voucher (Usage Exceeded)
Validate Limit Per Voucher (Usage Exceeded) with Option Apply Voucher
    [Tags]    voucher    limit    negative
    [Documentation]    Verify error when voucher usage exceeds allowed limit
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Voucher Discount    usageexceeded
    Then Check validation error message Android    //android.view.View[@content-desc="Voucher has reached its usage limit."]    Voucher has reached its usage limit.

# Test Case: Validate Limit Per User (User Limit Exceeded)
Validate Limit Per User (User Limit Exceeded) with Option Apply Voucher
    [Tags]    voucher    user_limit    negative
    [Documentation]    Verify error when user exceeds allowed voucher usage
    Given Find and choose Technician    caisse
    And Find Categories services      Acrylic Full Set w/ Gel
    Then Check validation error message Android    //android.view.View[@content-desc="$50.00"]    $50.00
    And Check validation error message Android    //android.view.View[@content-desc="$2.50"]    $2.50
    And Check validation error message Android    //android.view.View[@content-desc="$52.50"]    $52.50
    When Apply Voucher Discount    userlimitexceeded
    Then Check validation error message Android    //android.view.View[@content-desc="Voucher has reached its usage limit."]    Voucher has reached its usage limit.

# Test Case: Validate Minimum Spend Requirement
Validate Minimum Spend Requirement with Option Apply Voucher
    [Tags]    voucher    min_spend    negative
    [Documentation]    Verify error when order total is less than voucher minimum spend
    Given Find and choose Technician    caisse
    And Find Categories services      Deluxe Pedicure
    Then Check validation error message Android    //android.view.View[@content-desc="$35.00"]    $35.00
    And Check validation error message Android    //android.view.View[@content-desc="$1.75"]    $1.75
    And Check validation error message Android    //android.view.View[@content-desc="$36.75"]    $36.75
    When Apply Voucher Discount    minimumspend50
    Then Check validation error message Android    //android.view.View[@content-desc="The minimum spent required to apply this voucher is $50.00"]    The minimum spent required to apply this voucher is $50.00
##Method Cash

*** Keywords ***
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
    

Pay By Credit Card
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    ${elm_Method_CreditCard}
    Click on Element mobile    ${elm_btn_Skip}
    Click on Element mobile    ${elm_btn_BeginCharge}

Pay By Gift Card
    [Arguments]    ${gift_card}
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    //android.view.View[@content-desc="Gift Card"]
    Click on Element mobile    //android.widget.EditText
    Fill Text Input mobile    //android.widget.EditText    ${gift_card}
    Click on Element mobile    //android.view.View[@content-desc="Apply"]

Pay By Cash
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    ${elm_Option_Cash}
    Click on Element mobile    ${elm_btn_BeginCharge}

Pay By Paid Externally
    Click on Element mobile    ${elm_btn_Payment}
    Click on Element mobile    //android.view.View[@content-desc="Paid Externally"]
    Click on Element mobile    ${elm_btn_Skip}
    Click on Element mobile    ${elm_btn_BeginCharge}

Sign And Confirm Payment
    Swipe    600    300    1250    300
    Swipe    928    300    918    750
    Click on Element mobile    ${elm_btn_Done}

Choose No Receipt
    Click on Element mobile    ${elm_Option_NoReceipt}

Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}"]
    END
