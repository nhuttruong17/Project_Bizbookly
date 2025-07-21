*** Settings ***
Resource        ../../Resources/PageObject/LoginPage/LoginPage.robot
Resource        ../../TestData/LoginData/LoginData.robot
Suite Setup     Basic Setup iOS
Suite Teardown  Basic TearDowns iOS
Documentation   BDD Structure for iOS Login Flow Tests

*** Test Cases ***
Validate Empty Fields Validation
    [Tags]    login    validation    empty_fields    smoke
    [Documentation]    Kiểm tra validation khi không nhập UserName & Password
    Given User is on Login Screen iOS
    When User clicks Sign In button iOS
    Then System should display empty field validation errors for both username and password iOS

Validate Minimum Password Length
    [Tags]    login    validation    password_length    security
    [Documentation]    Kiểm tra validation khi nhập password ngắn hơn quy định
    Given User is on Login Screen iOS
    When User enters password with minimum length iOS     ${Min_textPassword}
    And User clicks Sign In button iOS
    Then System should display minimum password length error message iOS

Validate Login with Invalid Credentials
    [Tags]    login    validation    invalid_credentials    security
    [Documentation]    Kiểm tra login thất bại với username đúng, password sai
    Given User is on Login Screen iOS
    When User fills in Invalid credentials iOS
    And User clicks Sign In button iOS
    Then System should display login failed error message iOS

Validate Successful Login
    [Tags]    login    positive    successful_login    smoke
    [Documentation]    Kiểm tra login thành công với thông tin hợp lệ
    Given User is on Login Screen iOS
    When User fills in Valid credentials iOS
    And User clicks Sign In button iOS
    Then User should be successfully logged in and redirected to main screen iOS

Validate Successful Logout
    [Tags]    logout    positive    successful_logout    smoke
    [Documentation]    Kiểm tra logout thành công
    Given User should be successfully logged in and redirected to main screen iOS
    When User clicks Sign Out button iOS
    And User confirms logout action iOS
    Then User should be logged out and redirected to login screen iOS

*** Keywords ***
# Given Keywords
User is on Login Screen iOS
    # Click on Element mobile    ${Role_Supplier}
    Click on Element mobile    ${Role_Salon}

# When Keywords
User enters password with minimum length iOS
    [Arguments]    ${password}
    Click on Element mobile    //XCUIElementTypeTextField[@name="Password"]
    Fill Text Input mobile     ${input_field_password_iOS}  ${password}
    Click on Element mobile    ${Title_Password_iOS}

User clicks Sign In button iOS
    Click on Element mobile    ${btn_Sign_In_iOS}

User fills in Invalid credentials iOS
    Fill Text Input mobile     ${input_field_Username_iOS}    ${Valid_UserID}
    Click on Element mobile    ${Title_UserName_iOS}
    Click on Element mobile    ${Show_eye_password_iOS}
    Clear Text                 //XCUIElementTypeTextField[@value="${Min_textPassword}"]
    Fill Text Input mobile     ${input_field_password_iOS2}    ${Invalid_Password}
    Click on Element mobile    ${Title_Password_iOS}

User fills in Valid credentials iOS
    Clear Text                  //XCUIElementTypeTextField[@value="${Valid_UserID}"]
    Fill Text Input mobile      ${input_field_Username_iOS}    ${Email_school}
    Click on Element mobile     ${Title_UserName_iOS}
    Clear Text                  //XCUIElementTypeTextField[@value="${Invalid_Password}"]
    Fill Text Input mobile      ${input_field_password_iOS2}    ${Valid_Password}
    Click on Element mobile     ${Title_Password_iOS}

User clicks Sign Out button iOS
    Sleep    2s
    Click on Element mobile     ${elm_Sign_Out_iOS}

User confirms logout action iOS
    Click on Element mobile     ${elm_confirm_Yes}

# Then Keywords
System should display empty field validation errors for both username and password iOS
    Check validation error message mobile    ${Valid_emty1}    ${Expected_emptyfield}
    Check validation error message mobile    ${Valid_emty2}    ${Expected_emptyfield}

System should display minimum password length error message iOS
    Check validation error message mobile    ${elm_error_minPassword_iOS}   ${Expected_MinPassword_iOS}

System should display login failed error message iOS
    Check validation error message mobile    ${elm_error_loginfailed}    ${Expected_error_loginfailed}

User should be successfully logged in and redirected to main screen iOS
    Check validation error message mobile    ${elm_Change_position}    ${Expected_Change_position}

User should be logged out and redirected to login screen iOS
    Check validation error message mobile    ${Title_Sign_In_iOS}    ${Content_Sign_In_iOS}

