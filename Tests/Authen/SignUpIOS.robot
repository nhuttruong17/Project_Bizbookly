*** Settings ***
Resource        ../../Resources/PageObject/LoginPage/LoginPage.robot
Resource        ../../TestData/LoginData/LoginData.robot
Resource        ../../Resources/Locators/SignUpLocators.robot
Suite Setup     Basic Setup iOS
Suite Teardown  Basic TearDowns iOS


*** Test Cases ***
Navigate to Sign Up Page
    Click on Element mobile    ${elm_SignUp_iOS}
Check validation empty Email error
    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}
Check validation email missing @
    Fill Text Input mobile    ${elm_input_Email_iOS}    userexample.com
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
Check validation email missing domain
    Clear Text    //XCUIElementTypeTextField[@value="userexample.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    user@
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
Check validation email missing Local Part
    Clear Text    //XCUIElementTypeTextField[@value="user@"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    @example.com
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
Check validation email contains spaces
    Clear Text    //XCUIElementTypeTextField[@value="@example.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    user @example.com
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
Check validation email contains special characters
    Clear Text    //XCUIElementTypeTextField[@value="user @example.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    user!@example.com
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
Check validation email Multiple '@'
    Clear Text    //XCUIElementTypeTextField[@value="user!@example.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    user@@example.com
    Check validation error message mobile    ${elm_error_Email_invalid_iOS}    ${Expected_Email_invalid_iOS}
### Check validation Password

Show eye new password
    Click on Element mobile    ${elm_show_eye_newPassword_iOS}
Check validation password empty
    Fill Text Input mobile      ${elm_input_NewPassword_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}

Check validation password too short
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    ab12
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_minPassword_iOS}    ${Expected_error_minPassword_iOS}

Check validation password missing uppercase
    Clear Text    //XCUIElementTypeTextField[@value="ab12"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    password123!
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_rule_iOS}    ${Expected_rule_iOS}

Check validation password missing lowercase
    Clear Text    //XCUIElementTypeTextField[@value="password123!"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    PASSWORD123!
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_rule_iOS}    ${Expected_rule_iOS}

Check validation password missing number
    Clear Text    //XCUIElementTypeTextField[@value="PASSWORD123!"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    Password!
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_rule_iOS}    ${Expected_rule_iOS}

Check validation password missing special character
    Clear Text    //XCUIElementTypeTextField[@value="Password!"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    Password123
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_rule_iOS}    ${Expected_rule_iOS}

### Check validation Confirm Password
Show eye confirm password
    Click on Element mobile    ${elm_show_eye_confirmPassword_iOS}
Check validation confirm password empty
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile     ${elm_error_input_field_iOS}   ${Expected_error_validation_iOS}

Check validation confirm password too short
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    ab12
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_minPassword_iOS}    ${Expected_error_minPassword_iOS}

Check validation confirm password not match
    Clear Text    //XCUIElementTypeTextField[@value="Password123"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS}    School123@
    Click on Element mobile    ${elm_Title_Account_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="ab12"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    Dev123@@
    Click on Element mobile    ${elm_Title_Account_iOS}
    Check validation error message mobile    ${elm_error_samePassword_iOS}    ${Expected_samePassword_iOS}
##Check Email address exist
Check email address exist
    Clear Text    //XCUIElementTypeTextField[@value="user@@example.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    school@yopmail.com
    Click on Element mobile    ${elm_Title_Account_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="School123@"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    School123@
    Click on Element mobile    ${elm_Title_Account_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="Dev123@@"]
    Fill Text Input mobile    ${elm_input_NewPassword_iOS_2}    School123@
    Click on Element mobile    ${elm_Title_Account_iOS}
    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    ${elm_email_exist_iOS}    ${Expected_email_exist_iOS}

##Sign up email success
Check Sign Up Success
    Clear Text    //XCUIElementTypeTextField[@value="school@yopmail.com"]
    Fill Text Input mobile    ${elm_input_Email_iOS}    inactive@yopmail.com
    Click on Element mobile    ${elm_Title_Account_iOS}
    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="Salon Onboarding"]    Salon Onboarding

###Personal Information
Check First Name empty
    Fill Text Input mobile    ${elm_input_FirstName_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    This field is required
Check First Name min length
    Fill Text Input mobile    ${elm_input_FirstName_iOS}    a
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field must have at least 2 characters"]    This field must have at least 2 characters
Check First Name max length
    Clear Text    //XCUIElementTypeTextField[@value="a"]
    Fill Text Input mobile    ${elm_input_FirstName_iOS}    abcdefghijklmnopqrstuvwxyz!@#$%^&
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field mustn't be 32 characters"]    This field mustn't be 32 characters
Check Last Name empty
    Fill Text Input mobile    ${elm_input_LastName_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    This field is required
Check Last Name min length
    Fill Text Input mobile    ${elm_input_LastName_iOS}    b
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field must have at least 2 characters"]    This field must have at least 2 characters
##Bug Skip wait fix -> Enter 51 => 255
Check Last Name max length
    Clear Text    //XCUIElementTypeTextField[@value="b"]
    Fill Text Input mobile    ${elm_input_LastName_iOS}    abcdefghijklmnopqrstuvwxyz!@#$%^&1234567890abcdefga
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="This field mustn't be 255 characters"]    This field mustn't be 255 characters
Check Gender
    Click on Element mobile    //XCUIElementTypeStaticText[@name="select gender"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Male"]
    Click on Element mobile    ${elm_btn_Submit_iOS}
###Check DoB
Check DoB
    Click on Element mobile    //XCUIElementTypeOther[@name="Select date of birth"]
    Swipe Dob    2023    June    17
###Check DoB

Check Street Address min length
    Fill Text Input mobile    ${elm_input_StressAddress_iOS}    c
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}
Check Street Address max length
    Clear Text    //XCUIElementTypeTextField[@value="c"]
    Fill Text Input mobile    ${elm_input_StressAddress_iOS}    ${Long_address}
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    xpath=(//XCUIElementTypeStaticText[@name="This field mustn't be 255 characters"])[2]    ${Expected_error_255Characters_iOS}
Check City empty
    Fill Text Input mobile    ${elm_input_City_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Personal_iOS}
    Click on Element mobile   ${btn_Next_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}
Check State selection
    Click on Element mobile    //XCUIElementTypeImage[contains(@name, "Select state") and contains(@name, "This field is required")]
    Fill Text Input mobile     //XCUIElementTypeTextField[@name="Search State"]    Florida
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Florida"]
Check Zipcode valid input
    Click on Element mobile    //XCUIElementTypeOther[@name="Enter zipcode"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="0"]
    Click on Element mobile    ${elm_btn_Done_iOS}

Check Phone Number empty
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    ${elm_btn_Done_iOS}
    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    xpath=(//XCUIElementTypeStaticText[@name="This field is required"])[2]    ${Expected_error_validation_iOS}

Check Phone Number min digits
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    ${elm_btn_Done_iOS}
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber}    ${Expected_invalid_PhoneNumber}

Check Phone Number invalid format
    Click on Element mobile    //XCUIElementTypeOther[@value="(321) 2"]
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
    Click on Element mobile    ${elm_btn_Done_iOS}
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber}    ${Expected_invalid_PhoneNumber}


Check Valid Personal Information
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

    Click on Element mobile    ${btn_Next_iOS}
    Check validation error message mobile    ${elm_Title_Business_iOS}    ${Expected_Title_Business_iOS}

Check Upload file = camera
    Click on Element mobile    ${elm_Choose_Image_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="CAMERA"]
#FrontBackCamera    Click on Element mobile    //XCUIElementTypeButton[@name="FrontBackFacingCameraChooser"]
    Click on Element mobile    //XCUIElementTypeButton[@name="PhotoCapture"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Use Photo"]
    Click on Element mobile    //XCUIElementTypeButton[@name="selected"]
    Sleep    2s
    Click on Element mobile    //XCUIElementTypeApplication[@name="Salonbookly Manager Dev"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]
    Click on Element mobile    xpath=//XCUIElementTypeStaticText[contains(@name, "Choose an image") and contains(@name, "Select file")]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="GALLERY"]
    Fill Text Input mobile     //XCUIElementTypeTextView[@value="Tìm kiếm trong thư viện của bạn…"]    2024
    Click on Element mobile    //XCUIElementTypeButton[@name="Search"]
    Swipe find image            Ảnh, ngày 12 tháng 4, 2024, 10:17
    Click on Element mobile    //XCUIElementTypeButton[@name="selected"]
    Sleep    2s
###Check Business Information
Check Store Name empty
    Swipe    452    645    457    352
    Fill Text Input mobile    ${elm_input_StoreName_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile     ${elm_error_validation_iOS_1}   ${Expected_error_validation_iOS}
    Swipe    452    645    457    550
Check Store Name min length
    Fill Text Input mobile    ${elm_input_StoreName_iOS}    a
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}
Check Store Name max length
    Clear Text    //XCUIElementTypeTextField[@value="a"]
    Fill Text Input mobile    ${elm_input_StoreName_iOS}    abcdefghijklmnopqrstuvwxyz!@#$%^&
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_max_Character_iOS}    ${Expected_max_Character_iOS}
Check Street Address empty BN
    Fill Text Input mobile     ${elm_input_StressAddress_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}
Check Street Address min length BN
    Fill Text Input mobile     ${elm_input_StressAddress_iOS}    c
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}
Check Street Address max length BN
    Clear Text    //XCUIElementTypeTextField[@value="c"]
    Fill Text Input mobile     ${elm_input_StressAddress_iOS}    ${Long_address}
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_error_255Characters_iOS}    ${Expected_error_255Characters_iOS}
Check City empty BN
    Fill Text Input mobile     ${elm_input_City_iOS}    ${EMPTY}
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_error_validation_iOS_1}    ${Expected_error_validation_iOS}
Check City min length BN
    Fill Text Input mobile     ${elm_input_City_iOS}    c
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}
Check City max length BN
    Clear Text    //XCUIElementTypeTextField[@value="c"]
    Fill Text Input mobile     ${elm_input_City_iOS}    ${Long_address1}
    Click on Element mobile    ${elm_Title_Business_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_error_255Characters_iOS}    ${Expected_error_255Characters_iOS}
Check State Selection BN
    Click on Element mobile    //XCUIElementTypeImage[contains(@name, "Select state") and contains(@name, "This field is required")]
    Fill Text Input mobile     //XCUIElementTypeTextField[@name="Search State"]    Florida
    Click on Element mobile    //XCUIElementTypeStaticText[@name="Florida"]

Check min Zipcode BN
    Click on Element mobile    //XCUIElementTypeOther[@name="Enter zipcode"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="8"]
    Click on Element mobile    ${elm_btn_Done_iOS}
    Check validation error message mobile    //XCUIElementTypeStaticText[@name="The zipcode must be 5 characters"]    The zipcode must be 5 characters
Check Phone number empty BN
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    ${elm_btn_Clear_iOS}
    Click on Element mobile    ${elm_btn_Done_iOS}
    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_error_input_field_iOS}    ${Expected_error_validation_iOS}
Check Phone number min digits BN
    Click on Element mobile    ${elm_input_PhoneNumber_iOS}
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="3"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="1"]
    Click on Element mobile    //XCUIElementTypeStaticText[@name="2"]
    Click on Element mobile    ${elm_btn_Done_iOS}
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber}    ${Expected_invalid_PhoneNumber}
Check Phone number invalid format BN
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
    Click on Element mobile    ${elm_btn_Done_iOS}
    Check validation error message mobile    ${elm_error_invalid_PhoneNumber}    ${Expected_invalid_PhoneNumber}
Check min About Us BN
    Fill Text Input mobile    ${elm_input_aboutUs_iOS}    a
    Click on Element mobile    ${elm_Title_aboutUs_iOS}
    Check validation error message mobile    ${elm_min_Character_iOS}    ${Expected_min_Character_iOS}
Check max About Us BN
    Clear Text    //XCUIElementTypeTextField[@value="a"]
    Fill Text Input mobile    ${elm_input_aboutUs_iOS}    ${Long_AboutUs}
    Click on Element mobile    ${elm_Title_aboutUs_iOS}
    Check validation error message mobile    ${elm_error_AboutUs_iOS}    ${Expected_error_AboutUs_iOS}

####Check valid Business Information
Check Valid Business Information
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

    Click on Element mobile    ${elm_btn_Submit_iOS}
    Check validation error message mobile    ${elm_Title_RegisterSuccess_iOS}    ${Expected_RegisterSuccess_iOS}


