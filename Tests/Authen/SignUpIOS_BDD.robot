*** Settings ***
Resource        ../../TestKeyWords/Common.robot
Resource        ../../Resources/Locators/SignUpLocators.robot
Suite Setup     Basic Setup iOS
Suite Teardown  Basic TearDowns iOS
Documentation   BDD Structure for IOS Sign Up Flow

*** Test Cases ***
Validate Navigate to Account Information
    [Tags]    sign_up    navigation
    [Documentation]    Kiểm tra điều hướng sang màn Account Information khi nhấn Sign Up
    Given User is on Sign In screen
    When Click on Element mobile    ${elm_SignUp_iOS}
    Then System should display Account Information

Validate Sign Up Empty Email
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi không nhập email
    Given User is on Account Information screen
    When User enters email "${EMPTY}"
    And User submits the sign up form
    Then System should display empty email error message

Validate Sign Up Email Missing At
     [Tags]    sign_up    email    validation
     [Documentation]    Kiểm tra validation khi email thiếu ký tự @
     Given User is on Account Information screen
     When User enters email "userexample.com"
     And User submits the sign up form
     Then System should display invalid email error message

Validate Sign Up Email Missing Domain
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email thiếu domain
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="userexample.com"]
    And User enters email "user@"
    And User submits the sign up form
    Then System should display invalid email error message

Validate Sign Up Email Missing Local Part
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email thiếu local part
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="user@"]
    And User enters email "@example.com"
    And User submits the sign up form
    Then System should display invalid email error message

Validate Sign Up Email Contains Spaces
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email chứa dấu cách
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="@example.com"]
    And User enters email "user @example.com"
    And User submits the sign up form
    Then System should display invalid email error message

Validate Sign Up Email Contains Special Characters
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email chứa ký tự đặc biệt
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="user @example.com"]
    When User enters email "user!@example.com"
    And User submits the sign up form
    Then System should display invalid email error message

Validate Sign Up Email Multiple At
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email có nhiều ký tự @
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="user!@example.com"]
    And User enters email "user@@example.com"
    And User submits the sign up form
    Then System should display invalid email error message

Validate Sign Up Password Empty
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi không nhập mật khẩu
    Given User is on Account Information screen
    When Click on Element mobile    ${elm_show_eye_newPassword_iOS}
    And User enters password "${EMPTY}"
    And User submits the sign up form
    Then System should display empty password error message

Validate Sign Up Password Too Short
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi mật khẩu quá ngắn
    Given User is on Account Information screen
    When User enters password "ab12"
    And User submits the sign up form
    Then System should display password too short error message

Validate Sign Up Password Missing Uppercase
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi mật khẩu thiếu ký tự in hoa
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="ab12"]
    And User enters password "password123!"
    And User submits the sign up form
    Then System should display password rule error message

Validate Sign Up Password Missing Lowercase
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi mật khẩu thiếu ký tự thường
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="password123!"]
    And User enters password "PASSWORD123!"
    And User submits the sign up form
    Then System should display password rule error message

Validate Sign Up Password Missing Number
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi mật khẩu thiếu số
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="PASSWORD123!"]
    And User enters password "Password!"
    And User submits the sign up form
    Then System should display password rule error message

Validate Sign Up Password Missing Special Character
    [Tags]    sign_up    password    validation
    [Documentation]    Kiểm tra validation khi mật khẩu thiếu ký tự đặc biệt
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="Password!"]
    When User enters password "Password123"
    And User submits the sign up form
    Then System should display password rule error message

Validate Sign Up Confirm Password Empty
    [Tags]    sign_up    confirm_password    validation
    [Documentation]    Kiểm tra validation khi không nhập xác nhận mật khẩu
    Given User is on Account Information screen
    When Click on Element mobile    ${elm_show_eye_confirmPassword_iOS}
    And User enters confirm password "${EMPTY}"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And User submits the sign up form
    Then System should display empty confirm password error message

Validate Sign Up Confirm Password Too Short
    [Tags]    sign_up    confirm_password    validation
    [Documentation]    Kiểm tra validation khi xác nhận mật khẩu quá ngắn
    Given User is on Account Information screen
    When User enters confirm password "ab12"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And User submits the sign up form
    Then System should display confirm password too short error message

Validate Sign Up Confirm Password Not Match
    [Tags]    sign_up    confirm_password    validation
    [Documentation]    Kiểm tra validation khi xác nhận mật khẩu không khớp
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="Password123"]
    And User enters password "School123@"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And Clear Text    //XCUIElementTypeTextField[@value="ab12"]
    And User enters confirm password "Dev123@@"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And User submits the sign up form
    Then System should display confirm password not match error message

Validate Sign Up Email Exists
    [Tags]    sign_up    email    validation
    [Documentation]    Kiểm tra validation khi email đã tồn tại
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="user@@example.com"]
    And User enters email "school@yopmail.com"
    And Clear Text    //XCUIElementTypeTextField[@value="School123@"]
    And User enters password "School123@"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And Clear Text    //XCUIElementTypeTextField[@value="Dev123@@"]
    And User enters confirm password "School123@"
    And User submits the sign up form
    Then System should display email exist error message

Validate Sign Up Email Success
    [Tags]    sign_up    email    positive
    [Documentation]    Kiểm tra đăng ký thành công với email hợp lệ
    Given User is on Account Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="school@yopmail.com"]
    And User enters email "inactive@yopmail.com"
    And Click on Element mobile    ${elm_Title_Account_iOS}
    And User submits the sign up form
    Then System should display personal information screen

Validate Sign Up First Name Empty
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi không nhập First Name
    Given User is on Personal Information screen
    When User enters first name "${EMPTY}"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display first name required error message

Validate Sign Up First Name Min Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi First Name quá ngắn
    Given User is on Personal Information screen
    When Swipe    969    420    969    320
    And User enters first name "a"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display first name min length error message

Validate Sign Up First Name Max Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi First Name quá dài
    Given User is on Personal Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="a"]
    And User enters first name "abcdefghijklmnopqrstuvwxyz!@#$%^&"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display first name max length error message

Validate Sign Up Last Name Empty
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi không nhập Last Name
    Given User is on Personal Information screen
    When User enters last name "${EMPTY}"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display last name required error message

Validate Sign Up Last Name Min Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi Last Name quá ngắn
    Given User is on Personal Information screen
    When User enters last name "b"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display last name min length error message

Validate Sign Up Last Name Max Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi Last Name quá dài
    Given User is on Personal Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="b"]
    And User enters last name "abcdefghijklmnopqrstuvwxyz!@#$%^&1234567890abcdefga"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display last name max length error message

Validate Sign Up Gender Selection
    [Tags]    sign_up    personal    gender
    [Documentation]    Kiểm tra chọn giới tính
    Given User is on Personal Information screen
    When User selects gender
    And Click on Element mobile    ${elm_btn_Submit_iOS}
    Then System should display gender selected successfully

Validate Sign Up DoB Selection
     [Tags]    sign_up    personal    dob
     [Documentation]    Kiểm tra chọn ngày sinh
     Given User is on Personal Information screen
     When User selects date of birth
     Then System should display dob selected successfully

Validate Sign Up Street Address Min Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi Street Address quá ngắn
    Given User is on Personal Information screen
    When User enters street address "c"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display street address min length error message

Validate Sign Up Street Address Max Length
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi Street Address quá dài
    Given User is on Personal Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="c"]
    And User enters street address "${Long_address}"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display street address max length error message

Validate Sign Up City Empty
    [Tags]    sign_up    personal    validation
    [Documentation]    Kiểm tra validation khi không nhập City
    Given User is on Personal Information screen
    When User enters city "${EMPTY}"
    And Click on Element mobile    ${elm_Title_Personal_iOS}
    And User Next the personal info form
    Then System should display city required error message

Validate Sign Up State Selection
    [Tags]    sign_up    personal    state
    [Documentation]    Kiểm tra chọn State
    Given User is on Personal Information screen
    When User selects state
    Then System should display state selected successfully

Validate Sign Up Zipcode Valid Input
    [Tags]    sign_up    personal    zipcode
    [Documentation]    Kiểm tra nhập Zipcode hợp lệ
    Given User is on Personal Information screen
    When User enters zipcode by keypad
    And User done zipcode input
    Then System should display zipcode accepted successfully

Validate Sign Up Phone Number Empty
    [Tags]    sign_up    personal    phone    validation
    [Documentation]    Kiểm tra validation khi không nhập Phone Number
    Given User is on Personal Information screen
    When User clears phone number input
    And User done phone number input
    And User Next the personal info form
    Then System should display phone number required error message

Validate Sign Up Phone Number Min Digits
    [Tags]    sign_up    personal    phone    validation
    [Documentation]    Kiểm tra validation khi Phone Number quá ngắn
    Given User is on Personal Information screen
    When User input Phone Number min digits
    And User done phone number input
    And User Next the personal info form
    Then System should display phone number min digits error message

Validate Sign Up Phone Number Invalid Format
    [Tags]    sign_up    personal    phone    validation
    [Documentation]    Kiểm tra validation khi Phone Number sai định dạng
    Given User is on Personal Information screen
    When Click on Element mobile    //XCUIElementTypeOther[@value="(321) 2"]
    And Click on Element mobile    ${elm_btn_Clear_iOS}
    And User input Phone Number invalid format
    And User done phone number input
    And User Next the personal info form
    Then System should display phone number invalid format error message

Validate Sign Up Valid Personal Information
    [Tags]    sign_up    personal    happy_path
    [Documentation]    Kiểm tra nhập thông tin cá nhân hợp lệ và chuyển sang màn Business Info
    Given User is on Personal Information screen
    When User input valid Personal Information
    And User Next the personal info form
    Then System should display business information screen

Validate Upload File From Gallery
    [Tags]    sign_up    business    upload
    [Documentation]    Kiểm tra upload file từ gallery
    Given User is on Business Information screen
    When User uploads file from gallery
    Then System should display file uploaded successfully

Validate Store Name Empty
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi không nhập Store Name
    Given User is on Business Information screen
    When Swipe    452    750    452    340
    And User enters store name "${EMPTY}"
    And Swipe    452    710    457    530
    And User submits the business info form
    Then System should display store name required error message

Validate Store Name Min Length
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi Store Name quá ngắn
    Given User is on Business Information screen
    When Swipe    452    400    457    520
    And User enters store name "a"
    And Swipe    452    710    457    530
    And User submits the business info form
    And Swipe    452    400    457    520
    Then System should display store name min length error message

Validate Store Name Max Length
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi Store Name quá dài
    Given User is on Business Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="a"]
    And User enters store name "abcdefghijklmnopqrstuvwxyz!@#$%^&"  
    And Swipe    452    710    457    530  
    And User submits the business info form
    And Swipe    452    400    457    520
    Then System should display store name max length error message

Validate Street Address Empty BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi không nhập Street Address (Business)
    Given User is on Business Information screen
    When User enters business street address "${EMPTY}"
    And Swipe    452    710    457    530
    And User submits the business info form
    And Swipe    452    400    457    520
    Then System should display street address required error message

Validate Street Address Min Length BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi Street Address (Business) quá ngắn
    Given User is on Business Information screen
    When User enters business street address "c"
    And Swipe    452    710    457    530
    And User submits the business info form
    And Swipe    452    400    457    520
    Then System should display street address min length error message

Validate Street Address Max Length BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi Street Address (Business) quá dài
    Given User is on Business Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="c"]
    And User enters business street address "${Long_address}"
    And Swipe    452    710    457    530
    And User submits the business info form
    And Swipe    452    400    457    520
    Then System should display street address max length error message

Validate City Empty BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi không nhập City (Business)
    Given User is on Business Information screen
    When Swipe    452    710    457    530
    And User enters business city "${EMPTY}"
    And User submits the business info form
    Then System should display city required error message

Validate City Min Length BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi City (Business) quá ngắn
    Given User is on Business Information screen
    When User enters business city "c"
    And User submits the business info form
    Then System should display city min length error message

Validate City Max Length BN
    [Tags]    sign_up    business    validation
    [Documentation]    Kiểm tra validation khi City (Business) quá dài
    Given User is on Business Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="c"]
    When User enters business city "${Long_address1}"
    And User submits the business info form
    Then System should display city max length error message

Validate Sign Up State Selection BN
    [Tags]    sign_up    business    state
    [Documentation]    Kiểm tra chọn State
    Given User is on Business Information screen
    When User selects state
    And User submits the business info form
    Then System should display state selected successfully

Validate Business Zipcode Min Length
    [Tags]    sign_up    business    zipcode    validation
    [Documentation]    Kiểm tra validation khi Zipcode (Business) quá ngắn
    Given User is on Business Information screen
    When User enters BN zipcode min length by keypad
    And User done zipcode input
    And User submits the business info form
    Then System should display business zipcode min length error message

Validate Business Phone Number Empty
    [Tags]    sign_up    business    phone    validation
    [Documentation]    Kiểm tra validation khi không nhập Phone Number
    Given User is on Business Information screen
    When User clears phone number input
    And User done phone number input
    And User submits the business info form
    Then System should display BN phone number required error message

Validate Business Phone Number Min Digits
    [Tags]    sign_up    business    phone    validation
    [Documentation]    Kiểm tra validation khi Phone Number (Business) quá ngắn
    Given User is on Business Information screen
    When User enters business phone number min lenth by kepad
    And User done phone number input
    And User submits the business info form
    Then System should display business phone number min digits error message

Validate Business Phone Number Invalid Format
    [Tags]    sign_up    business    phone    validation
    [Documentation]    Kiểm tra validation khi Phone Number (Business) sai định dạng
    Given User is on Business Information screen
    When User enters business phone number by keypad invalid format
    And User done phone number input
    And User submits the business info form
    Then System should display business phone number invalid format error message

Validate Business About Us Min Length
    [Tags]    sign_up    business    about_us    validation
    [Documentation]    Kiểm tra validation khi About Us (Business) quá ngắn
    Given User is on Business Information screen
    When User enters business about us "a"
    And User submits the business info form
    Then System should display business about us min length error message

Validate Business About Us Max Length
    [Tags]    sign_up    business    about_us    validation
    [Documentation]    Kiểm tra validation khi About Us (Business) quá dài
    Given User is on Business Information screen
    When Clear Text    //XCUIElementTypeTextField[@value="a"]
    And User enters business about us "${Long_AboutUs}"
    And User submits the business info form
    Then System should display business about us max length error message

Validate Business Information Happy Path
    [Tags]    sign_up    business    happy_path
    [Documentation]    Kiểm tra nhập thông tin business hợp lệ và đăng ký thành công
    Given User is on Business Information screen
    When User input valid Business Information
    And User submits the business info form
    Then System should display register success screen

*** Keywords ***
User is on Sign In screen
    Click on Element mobile    ${Role_Salon}

User is on Account Information screen
    AppiumLibrary.Wait Until Element Is Visible    ${elm_Title_Account_iOS}    10s
System should display Account Information
    Check validation error message mobile    ${elm_Title_Account_iOS}    Account

User enters email "${email}"
    Click on Element mobile    ${elm_input_Email_iOS}
    Fill Text Input mobile    ${elm_input_Email_iOS}    ${email}

System should display empty email error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}

System should display invalid email error message
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}

System should display email exist error message
    Check validation error message mobile    ${elm_email_exist_iOS}    ${Expected_email_exist_iOS}

System should display personal information screen
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="* First Name"]    * First Name

User enters password "${password}"
    Click on Element mobile    ${elm_input_NewPassword_iOS}
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    ${password}

System should display empty password error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}

System should display password too short error message
    Check validation error message mobile    ${elm_error_minPassword_iOS}    ${Expected_error_minPassword_iOS}

System should display password rule error message
    Check validation error message mobile    ${elm_error_rule_iOS}    ${Expected_rule_iOS}

User is on Sign Up screen
    Click on Element mobile    ${elm_SignUp_iOS}

User submits the sign up form
    Click on Element mobile    ${elm_Title_Account_iOS}
    Click on Element mobile    ${btn_Next_iOS}

User enters confirm password "${password}"
    Click on Element mobile    ${elm_input_NewPassword_iOS_2}
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    ${password}

System should display empty confirm password error message
    Check validation error message mobile    ${elm_error_input_field_iOS}    ${Expected_error_validation_iOS}

System should display confirm password too short error message
    Check validation error message mobile    ${elm_error_minPassword_iOS}    ${Expected_error_minPassword_iOS}

System should display confirm password not match error message
    Check validation error message mobile    ${elm_error_samePassword_iOS}    ${Expected_samePassword_iOS}

####Personal Information BDD
User is on Personal Information screen
    No Operation

User enters first name "${first_name}"
    Click on Element mobile    ${elm_input_FirstName_iOS}
    Fill Text Input mobile    ${elm_input_FirstName_iOS}    ${first_name}

User enters last name "${last_name}"
    Click on Element mobile    ${elm_input_LastName_iOS}
    Fill Text Input mobile    ${elm_input_LastName_iOS}    ${last_name}

User Next the personal info form
    Click on Element mobile   ${btn_Next_iOS}

System should display first name required error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    This field is required

System should display first name min length error message
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field must have at least 2 characters"]    This field must have at least 2 characters

System should display first name max length error message
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field mustn't be 32 characters"]    This field mustn't be 32 characters

System should display last name required error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    This field is required

System should display last name min length error message
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field must have at least 2 characters"]    This field must have at least 2 characters

System should display last name max length error message
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field mustn't be 255 characters"]    This field mustn't be 255 characters

User enters street address "${address}"
    Click on Element mobile    ${elm_input_StressAddress_iOS}
    Fill Text Input mobile    ${elm_input_StressAddress_iOS}    ${address}

System should display street address min length error message
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}

System should display street address max length error message
    Check validation error message mobile    ${elm_error_255Characters_iOS}    ${Expected_error_255Characters_iOS}

User enters city "${city}"
    Click on Element mobile    ${elm_input_City_iOS}
    Fill Text Input mobile    ${elm_input_City_iOS}    ${city}

System should display city required error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}

User selects gender
    Click on Element mobile    //XCUIElementTypeStaticText[@name="select gender"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Male"]

System should display gender selected successfully
    No Operation

User selects date of birth
    Click on Element mobile    //XCUIElementTypeOther[@name="Select date of birth"]
    Swipe Dob   2023    July    17

System should display dob selected successfully
    Check validation error message mobile    //XCUIElementTypeOther[@value="2023-07-17"]    2023-07-17


User selects state
    Click on Element mobile    //XCUIElementTypeImage[contains(@name, "Select state") and contains(@name, "This field is required")]
    Fill Text Input mobile     //XCUIElementTypeTextField[@name="Search State"]    Florida
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Florida"]

System should display state selected successfully
    No Operation

User enters zipcode by keypad
    Click on Element mobile    //XCUIElementTypeOther[@name="Enter zipcode"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]

User done zipcode input
    Click on Element mobile    ${elm_btn_Done_iOS}

System should display zipcode accepted successfully
    No Operation

User clears phone number input
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    ${elm_btn_Clear_iOS}

User done phone number input
    Click on Element mobile    ${elm_btn_Done_iOS}

System should display phone number required error message
    Check validation error message mobile    xpath=(//XCUIElementTypeStaticText[@name="This field is required"])[2]    ${Expected_error_validation_iOS}

User input Phone Number min digits
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]

System should display phone number min digits error message
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber_iOS}    ${Expected_invalid_PhoneNumber_iOS}

User input Phone Number invalid format
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="4"]

System should display phone number invalid format error message
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber_iOS}    ${Expected_invalid_PhoneNumber_iOS}

User input valid Personal Information
    Swipe    966    377    966    420
    Clear Text    //XCUIElementTypeTextField[@value="abcdefghijklmnopqrstuvwxyz!@#$%^&"]
    Fill Text Input mobile     ${elm_input_FirstName_iOS}    Inactive
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="abcdefghijklmnopqrstuvwxyz!@#$%^&1234567890abcdefga"]
    Fill Text Input mobile     ${elm_input_LastName_iOS}    Lii
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="${Long_address}"]
    Fill Text Input mobile     ${elm_input_StressAddress_iOS}     Lauderdale
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Fill Text Input mobile     ${elm_input_City_iOS}    Orlando
    Click on Element mobile    ${elm_Title_Personal_iOS}

    Click on Element mobile    //XCUIElementTypeOther[@value="(000) 989-1234"]
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="6"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="7"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="6"]
    Click on Element mobile    ${elm_btn_Done_iOS}
    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    ${elm_error_PhoneNumber_Exists_iOS}    ${Expected_error_PhoneNumber_Exists_iOS}

    Click on Element mobile    //XCUIElementTypeOther[@value="(999) 368-7896"]
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="4"]
    Click on Element mobile    ${elm_btn_Done_iOS}

System should display business information screen    
    Check validation error message mobile    ${elm_Title_Business_iOS}    ${Expected_Title_Business_iOS}

####Business Information BDD

User uploads file from gallery
    Click on Element mobile    ${elm_Choose_Image_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="CAMERA"]
#FrontBackCamera    Click on Element mobile    //XCUIElementTypeButton[@name="FrontBackFacingCameraChooser"]
    Click on Element mobile    //XCUIElementTypeButton[@name="PhotoCapture"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Use Photo"]
    Click on Element mobile    //XCUIElementTypeButton[@name="selected"]
    Sleep    2s
    Click on Element mobile    //XCUIElementTypeApplication[@name="Salonbookly Manager Dev"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]
    Click on Element mobile    ${elm_Choose_Image_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="GALLERY"]
     Fill Text Input mobile     //XCUIElementTypeTextView[@value="Tìm kiếm trong thư viện của bạn…"]    2024
#    Fill Text Input mobile     //XCUIElementTypeStaticText[@name="Search your library…"]    2024
    Click on Element mobile    //XCUIElementTypeButton[@name="Search"]
    # Swipe find image            Image, 12 July, 2024, 10:17
    Swipe find image            Ảnh, ngày 12 tháng 4, 2024, 10:17
    Click on Element mobile    //XCUIElementTypeButton[@name="selected"]
    Sleep    2s

User enters store name "${store_name}"
    Fill Text Input mobile    ${elm_input_StoreName_iOS}    ${store_name}
    Click on Element mobile    ${elm_Title_Business_iOS}

User enters business street address "${address}"
    Fill Text Input mobile    ${elm_input_StressAddress_iOS}    ${address}
    Click on Element mobile    ${elm_Title_Business_iOS}

User enters business city "${city}"
    Fill Text Input mobile    ${elm_input_City_iOS}    ${city}
    Click on Element mobile    ${elm_Title_Business_iOS}

User enters BN zipcode min length by keypad
    Click on Element mobile    //XCUIElementTypeOther[@name="Enter zipcode"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]

User enters business phone number min lenth by kepad
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]

User enters business phone number by keypad invalid format
    Click on Element mobile    //XCUIElementTypeOther[@value="(331) 2"]
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="4"]

User enters business about us "${aboutUs}"
    Fill Text Input mobile    ${elm_input_aboutUs_iOS}    ${aboutUs}
    Click on Element mobile    ${elm_Title_Business_iOS}

User input valid Business Information
    Swipe    971    226    971    450
    Clear Text    //XCUIElementTypeTextField[@value="abcdefghijklmnopqrstuvwxyz!@#$%^&"]
    Fill Text Input mobile     ${elm_input_StoreName_iOS}    Inactive Store
    Click on Element mobile    ${elm_Title_Business_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="${Long_address}"]
    Fill Text Input mobile     ${elm_input_StressAddress_iOS}     Lauderdale
    Click on Element mobile    ${elm_Title_Business_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="${Long_address1}"]
    Fill Text Input mobile     ${elm_input_City_iOS}     Orlando
    Click on Element mobile    ${elm_Title_Business_iOS}

    Click on Element mobile    //XCUIElementTypeOther[@value="8"]
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    ${elm_btn_Done_iOS}

    Click on Element mobile    //XCUIElementTypeOther[@value="(000) 989-1234"]
    Click on Element mobile    ${elm_btn_Clear_iOS}

    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="9"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="4"]
    Click on Element mobile    ${elm_btn_Done_iOS}

    Clear Text    //XCUIElementTypeTextField[@value="${Long_AboutUs}"]
    Fill Text Input mobile     ${elm_input_aboutUs_iOS}   This is my store
    Click on Element mobile    ${elm_Title_aboutUs_iOS}

User is on Business Information screen
    # Giả sử đã ở màn hình Business Info, nếu cần có thể thêm bước điều hướng
    No Operation

User submits the business info form
    Click on Element mobile    ${elm_btn_Submit_iOS}

System should display file uploaded successfully
    No Operation

System should display store name required error message
    Check validation error message mobile     ${elm_error_validation_iOS_1}   ${Expected_error_validation_iOS}

System should display store name min length error message
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}

System should display store name max length error message
    Check validation error message mobile    ${elm_max_Character_iOS}    ${Expected_max_Character_iOS}

System should display street address required error message
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}

System should display city min length error message
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}

System should display city max length error message
    Check validation error message mobile    ${elm_error_255Characters_iOS}    ${Expected_error_255Characters_iOS}

System should display business zipcode min length error message
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="The zipcode must be 5 characters"]    The zipcode must be 5 characters

System should display BN phone number required error message
    Check validation error message mobile    ${elm_error_input_field_iOS}    ${Expected_error_validation_iOS}

System should display business phone number min digits error message
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber_iOS}    ${Expected_invalid_PhoneNumber_iOS}

System should display business phone number invalid format error message
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber_iOS}    ${Expected_invalid_PhoneNumber_iOS}

System should display business about us min length error message
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}

System should display business about us max length error message
    Check validation error message mobile    ${elm_error_AboutUs_iOS}    ${Expected_error_AboutUs_iOS}

System should display register success screen
    Check validation error message mobile    ${elm_Title_RegisterSuccess_iOS}    ${Expected_RegisterSuccess_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Back to Login"]
