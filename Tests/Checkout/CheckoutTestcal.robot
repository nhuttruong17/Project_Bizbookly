*** Settings ***
Resource        ../../TestKeyWords/Common.robot
Resource        ../../Resources/Locators/CheckoutLocators.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android
Library         Collections
Library         String

*** Variables ***

${Gift_card}        SGC240940632830
####Gift Card balances may be change with each payment
${Current_amount_Giftcard}        $224.80
*** Test Cases ***
Verify Checkout Paid Externally without discount and without tip
    [Tags]    checkout    no_voucher    no_tip    external_payment    success
    [Documentation]    Verify full checkout flow without any voucher or tip applied,
    ...    paid externally, and ensure total amount remains unchanged with confirmation displayed.
    Given Find and choose Technician    caisse
    And Select And Store Services Price
    When User proceeds to Payment
    When User selects payment method as Paid Externally
    Tip on service random
    # And Get value from system and compare with result
    # Then System should display original price breakdown    ${ORIGINAL_PRICE_SUM}    ${ORIGINAL_TAX_SUM}    ${ORIGINAL_TOTAL_SUM}
    # When User proceeds to Payment
    # Then System should show balance due    ${ORIGINAL_TOTAL_SUM}
    # When User selects payment method as Paid Externally
    # Then System should display tip screen with default tip amount    ${ORIGINAL_PRICE_SUM}
    # When User Skips Tip
    # Then System should still show total amount as    ${ORIGINAL_TOTAL_SUM}
    # And System should display tip detail with technician and amount tip    caisse    $0.00
    # When User Begins Charge
    # Then System should display notify message as     Proceed payment successfully
    # And System should display text on screen as     Your payment is confirmed!
    # When Choose No Receipt


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


### Test 
Select And Store Services Price
    [Arguments]    ${number_of_services}=2          ${discount_type}='none'        
    ##### Đây là xpath lấy tất cả service mà k lấy list of add on: //android.view.View[8]//android.view.View[contains(@content-desc, "$") and @clickable="true"]
    ##### Đây là xpath lấy tất cả list_of_add-ons mà k lấy service: //android.view.View[10]/android.view.View//android.view.View[contains(@content-desc, "$") and @clickable="true"]
    # Lấy tất cả service có content-desc chứa dấu $ VÀ có thể click được
    ${real_services}=    AppiumLibrary.Get Webelements    xpath=//android.view.View[contains(@content-desc, "$") and @clickable="true"]

    ${count}=    Get Length    ${real_services}
    Log    Số lượng service thực sự tìm thấy: ${count}
    Run Keyword If    ${count} < ${number_of_services}    Fail    Không đủ service thực sự để chọn ${number_of_services} dịch vụ!

    ${indexes}=    Evaluate    random.sample(range(${count}), ${number_of_services})    modules=random
    ${selected_service_texts}=    Create List
    ${subtotal_before_discount}=    Set Variable    ${0.0}
    ${total_tax_value}=             Set Variable    ${0.0}
    ${random_discount}=             Set Variable    ${0.0}


    FOR    ${index}    IN    @{indexes}
        ${service_element}=    Get From List    ${real_services}    ${index}
        ${service_text}=       AppiumLibrary.Get Element Attribute    ${service_element}    content-desc
        Log    Đã chọn Service: ${service_text}
        Append To List         ${selected_service_texts}    ${service_text}
        AppiumLibrary.Click Element    ${service_element}

        # Lấy giá của từng dịch vụ và cộng dồn vào subtotal trước discount
        ${price}=    Get Amount Value From Service Desc    ${service_text}
        ${subtotal_before_discount}=    Evaluate    ${subtotal_before_discount} + ${price}
        Log    ${subtotal_before_discount}
    END
    
    # --- Tính toán Discount ---
    IF    ${discount_type} == 'percentage'
        Click on Element mobile    //android.view.View[@content-desc="Discount" and @clickable="true"]
        Click on Element mobile    //android.view.View[@content-desc="Quick discount"]/android.view.View
        Click on Element mobile    //android.view.View[@content-desc="Off"]
        Click on Element mobile    //android.view.View[@content-desc="Select Discount"]/android.view.View[2]/android.view.View[6]/android.view.View
        
        # Tạo số ngẫu nhiên từ 1% đến 100%
        ${discount_percentage_subtotal}=     Evaluate       random.randint(1, 100)        modules=random
        Log    ${discount_percentage_subtotal}
        # Tính % của số ngẫu nhiên cho subtotal
        ${random_discount}=    Evaluate    round((${discount_percentage_subtotal} / 100) * ${subtotal_before_discount}, 2)
        Log    ${random_discount}
        # Chuyển số ngẫu nhiên thành chuỗi
        ${number_str}=    Convert To String    ${discount_percentage_subtotal}
        Log    ${number_str}
        # Chuyển số chuỗi thành danh sách
        ${number_list}=   Convert To List    ${number_str}
        Log    ${number_list}
        FOR    ${digit}    IN    @{number_list}
            Click on Element mobile    //android.view.View[@content-desc="${digit}"]
        END
        Click on Element mobile    ${elm_btn_Done}
        Click on Element mobile    ${elm_btn_Submit}

    ELSE IF  ${discount_type} == 'fixed'
        Click on Element mobile    //android.view.View[@content-desc="Discount" and @clickable="true"]
        Click on Element mobile    //android.view.View[@content-desc="Quick discount"]/android.view.View
        Click on Element mobile    //android.view.View[@content-desc="Fixed amount"]
        Click on Element mobile    //android.view.View[@content-desc="Select Discount"]/android.view.View[2]/android.view.View[4]/android.view.View
        # Định dạng subtotal thành 2 chữ số sau dấu thập phân
        ${format_subtotal}=     Evaluate    '{:.2f}'.format(${subtotal_before_discount})
        Log    ${format_subtotal}
        # Tạo một giá trị giảm giá ngẫu nhiên từ 1.00 đến ${format_subtotal} và làm tròn đến 2 chữ số
        ${random_discount}=     Evaluate       round(random.uniform(1.00, ${format_subtotal}), 2)    modules=random
        Log    ${random_discount}
        ${number_str}=    Convert To String    ${random_discount}
        Log    ${number_str}
        # Cắt bỏ dấu . để nhập numberpad
        ${number_str_no_dot}=    Replace String    ${number_str}    .    ${EMPTY}
        Log    ${number_str_no_dot}
        ${number_list}=   Convert To List    ${number_str_no_dot}
        FOR    ${digit}    IN    @{number_list}
            Click on Element mobile    //android.view.View[@content-desc="${digit}"]
        END
        Click on Element mobile    ${elm_btn_Done}
        Click on Element mobile    ${elm_btn_Submit}

    ELSE IF    ${discount_type} == 'none'
        No Operation
    ELSE 
        Fail    Invalid discount type: ${discount_type} must be 'fixed' or 'percent'.
    END
    
    # --- Tính toán Subtotal sau discount, Tax và Total cuối cùng ---
    ${final_subtotal_after_discount}=    Evaluate    round(${subtotal_before_discount} - ${random_discount}, 2)
    # ${total_tax_value}=                  Evaluate    round(${final_subtotal_after_discount} * 0.05, 2) # Thuế tính trên subtotal sau discount, tính tax không làm tròn
    ${total_tax_value}=    Evaluate    str(__import__('decimal').Decimal(str(${final_subtotal_after_discount} * 0.05)).quantize(__import__('decimal').Decimal('0.01'), rounding=__import__('decimal').ROUND_HALF_UP))   #>=5 tính tax làm tròn
    # ${total_tax_value}=    Evaluate    math.ceil(${final_subtotal_after_discount} * 0.05 * 100) / 100    modules=math        # Thuế tính trên subtotal sau discount, tính tax làm tròn
    ${final_total_value}=                Evaluate    round(${final_subtotal_after_discount} + ${total_tax_value}, 2)
    
    # Định dạng lại về dạng 2 số thập phân
    ${final_subtotal_str}=    Evaluate    f\"{${final_subtotal_after_discount}:.2f}\"
    ${final_tax_str}=         Evaluate    f\"{${total_tax_value}:.2f}\"
    ${final_total_str}=       Evaluate    f\"{${final_total_value}:.2f}\"
    ${final_discount_str}=    Evaluate    f\"{${random_discount}:.2f}\"
    ${final_before_discount}=    Evaluate    f\"{${subtotal_before_discount}:.2f}\"


    Log    Tổng Price (tính toán): Subtotal=${final_subtotal_str}, Discount=${final_discount_str}, Tax=${final_tax_str}, Total=${final_total_str}, Subtotalbefore=${final_before_discount}

    # Lưu vào biến Suite
    Set Suite Variable    ${ORIGINAL_PRICE_SUM}       ${final_subtotal_str} 
    Set Suite Variable    ${ORIGINAL_TAX_SUM}         ${final_tax_str}
    Set Suite Variable    ${ORIGINAL_TOTAL_SUM}       ${final_total_str}
    Set Suite Variable    ${ORIGINAL_DISCOUNT_VALUE}  ${final_discount_str} 
    Set Suite Variable    ${SELECTED_SERVICE_DESCS}   ${selected_service_texts}
    Set Suite Variable    ${DISCOUNT_TYPE_APPLIED}    ${discount_type} 
    

Tip on service random
    ## Tính toán Tip
    [Arguments]    ${tip_type}='tip_amount'
    ${random_discount}=             Set Variable    ${0.0}
    IF    ${tip_type} == 'tip_percentage'
        # Lấy tất cả các phần tử tip % có sẵn
        ${real_tip_percentage}=    AppiumLibrary.Get Webelements    xpath=//android.view.View[contains(@content-desc, "%") and @clickable="true"]
        # Đếm các phần tử lấy được
        ${count}=    Get Length    ${real_tip_percentage}
        Log    Số lượng service thực sự tìm thấy: ${count}
        # Chọn ngẫu nhiên một phần tử trong tip % 
        ${random_tip_percentage}=    Evaluate    random.randint(0, ${count} - 1)    modules=random
        # Lấy phần tử từ list bằng chỉ mục
        ${selected_tip_element}=    Get From List    ${real_tip_percentage}    ${random_tip_percentage}
        ${selected_tip_desc}=       AppiumLibrary.Get Element Attribute    ${selected_tip_element}    content-desc
        Log    Đã chọn tip phần trăm: ${selected_tip_desc}
        # Tách $amount để lấy amount% 
        ${tip_percent_match}=    Get Regexp Matches    ${selected_tip_desc}    (\\d+%)    1
        Log    ${tip_percent_match}
        #Click vào phần tử tip đã chọn
        AppiumLibrary.Click Element    //android.view.View[contains(@content-desc, "${selected_tip_desc}") and @clickable="true"]

        ${get_tip_percentage}=    Get From List    ${tip_percent_match}    0
        Log    ${get_tip_percentage}
        ${tip_percentage_amount}=   Replace String    ${get_tip_percentage}    %    ${EMPTY}
        Log    ${tip_percentage_amount}
        ${random_discount}=    Evaluate    round(${ORIGINAL_PRICE_SUM} * ${tip_percentage_amount} / 100, 2)
        Log    ${random_discount}
    
    ELSE IF  ${tip_type} == 'tip_amount'
        Click on Element mobile    //android.view.View[@content-desc="Custom Amount"]
        # Tạo một giá trị giảm giá ngẫu nhiên từ 1.00 đến ${format_subtotal} và làm tròn đến 2 chữ số
        ${random_discount}=     Evaluate       round(random.uniform(1.00, ${ORIGINAL_PRICE_SUM}), 2)    modules=random
        Log    ${random_discount}
        ${number_str}=    Convert To String    ${random_discount}
        Log    ${number_str}
        # Cắt bỏ dấu . để nhập numberpad
        ${number_str_no_dot}=    Replace String    ${number_str}    .    ${EMPTY}
        Log    ${number_str_no_dot}
        ${number_list}=   Convert To List    ${number_str_no_dot}
        FOR    ${digit}    IN    @{number_list}
            Click on Element mobile    //android.view.View[@content-desc="${digit}"]
        END
        Click on Element mobile    ${elm_btn_Submit}

    ELSE IF    ${tip_type} == 'none'
        No Operation
    ELSE 
        Fail    Invalid discount type: ${tip_type} must be 'tip_percentage' or 'tip_amount'.
    END
    
    # --- Tính toán Subtotal sau discount, Tax, Tip và  Total cuối cùng ---
    ${final_subtotal_after_discount}=    Evaluate    round(${ORIGINAL_TOTAL_SUM} + ${random_discount}, 2)
    Log    ${final_subtotal_after_discount}
    
    
    


Get value from system and compare with result
    ## Get value from system
    ${Subtotal_system}=    AppiumLibrary.Get Element Attribute    //android.view.View[@index=23 and @clickable="false"]    content-desc
    ${Subtotal_system_value}=    Get Amount Value From Service Desc    ${Subtotal_system}
    ${Subtotal_system_value}=    Evaluate    f\"{${Subtotal_system_value}:.2f}\"
    Log    ${Subtotal_system_value}
    ${Tax_system}=    AppiumLibrary.Get Element Attribute    //android.view.View[@index=27 and @clickable="false"]    content-desc
    ${Tax_system_value}=    Get Amount Value From Service Desc    ${Tax_system}
    ${Tax_system_value}=    Evaluate    f\"{${Tax_system_value}:.2f}\"
    Log    ${Tax_system_value}
    ${Total_system}=    AppiumLibrary.Get Element Attribute    //android.view.View[@index=28 and @clickable="false"]    content-desc
    ${Total_system_value}=    Get Amount Value From Service Desc    ${Total_system}
    ${Total_system_value}=    Evaluate    f\"{${Total_system_value}:.2f}\"
    Log    ${Total_system_value}

    ## So sánh giá trị của Subtotal_system_value với ORIGINAL_PRICE_SUM
    Should Be Equal    ${Subtotal_system_value}    ${ORIGINAL_PRICE_SUM}    Subtotal_system_value không khớp với ORIGINAL_PRICE_SUM    
    Should Be Equal    ${Tax_system_value}    ${ORIGINAL_TAX_SUM}    Tax_system_value không khớp với ORIGINAL_TAX_SUM
    Should Be Equal    ${Total_system_value}    ${ORIGINAL_TOTAL_SUM}    Total_system_value không khớp với ORIGINAL_TOTAL_SUM

    ## Đây là xpath của tip details: //android.view.View[contains(@content-desc, "$") and @index=0 and @clickable="false"]
Get Amount Value From Service Desc
    [Arguments]    ${desc}
    ${lines}=    Split String    ${desc}    \n
    ${amount_str}=    Strip String    ${lines}[-1]
    ${price_match}=    Evaluate    re.findall(r"\\$([0-9]+\\.[0-9]{2})", '''${amount_str}''')    modules=re
    Run Keyword If    ${price_match} == []    Fail    Không tìm thấy giá trong amount: ${amount_str}
    ${price_value}=    Evaluate    float(${price_match[0]})
    RETURN    ${price_value}
