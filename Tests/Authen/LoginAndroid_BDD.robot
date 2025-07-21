*** Settings ***
Resource        ../../Resources/PageObject/LoginPage/LoginPage.robot
Resource        ../../TestData/LoginData/LoginData.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android
Documentation   BDD Structure for Android Login Flow Tests

*** Test Cases ***
# Test Case 1: Validate Empty Fields
Validate Empty Fields Validation
    [Tags]    login    validation    empty_fields    smoke
    [Documentation]    Test validation when user tries to login without entering credentials
    Given User is on Login Screen
    When User clicks Sign In button without entering credentials
    Then System should display empty field validation errors for both username and password

# Test Case 2: Validate Minimum Password Length
Validate Minimum Password Length
    [Tags]    login    validation    password_length    security
    [Documentation]    Test validation when user enters password shorter than minimum requirement
    Given User is on Login Screen
    When User enters password with minimum length "${Min_textPassword}"
    And User clicks Sign In button
    Then System should display minimum password length error message

# Test Case 3: Validate Login with Invalid Credentials
Validate Login with Invalid Credentials
    [Tags]    login    validation    invalid_credentials    security
    [Documentation]    Test login failure with valid username but invalid password
    Given User is on Login Screen
    When User enters valid username "${Valid_UserID}"
    And User enters invalid password "${Invalid_Password}"
    And User clicks Sign In button
    Then System should display login failed error message

# Test Case 4: Validate Successful Login
Validate Successful Login
    [Tags]    login    positive    successful_login    smoke
    [Documentation]    Test successful login with valid credentials
    Given User is on Login Screen
    When User enters valid email "${Email_school}"
    And User enters valid password "${Valid_Password}"
    And User clicks Sign In button
    Then User should be successfully logged in and redirected to main screen

# Test Case 5: Validate Successful Logout
Validate Successful Logout
    [Tags]    logout    positive    successful_logout    smoke
    [Documentation]    Test successful logout functionality
    Given User should be successfully logged in and redirected to main screen
    When User clicks Sign Out button
    And User confirms logout action
    Then User should be logged out and redirected to login screen

*** Keywords ***
# Given Keywords
User is on Login Screen
    [Documentation]    Navigate to login screen and select Salon role
    # Click on Element mobile    ${Role_Supplier_Android}
    Click on Element mobile    ${Role_Salon_Android}

User is successfully logged in
    [Documentation]    Complete login process with valid credentials
    Click on Element mobile    ${Role_Salon_Android}
    Click on Element mobile    ${input_field_Username_Android}
    Fill Text Input mobile     ${input_field_Username_Android}    ${Email_school}
    Click on Element mobile    ${Title_UserName_Android}
    Click on Element mobile    ${input_field_password_Android}
    Fill Text Input mobile     ${input_field_password_Android}    ${Valid_Password}
    Click on Element mobile    ${Title_Password_Android}
    Click on Element mobile    ${btn_Sign_In_Android}
    Check validation error message Android    ${elm_Change_position_Android}    ${Expected_Change_position}

# When Keywords
User clicks Sign In button without entering credentials
    [Documentation]    Click sign in button without filling any fields
    Click on Element mobile    ${btn_Sign_In_Android}

User enters password with minimum length "${password}"
    [Documentation]    Enter password that is shorter than minimum requirement
    Click on Element mobile    ${input_field_password_Android}
    Fill Text Input mobile     ${input_field_password_Android}    ${password}
    Click on Element mobile    ${Title_Password_Android}

User clicks Sign In button
    [Documentation]    Click the sign in button to submit login form
    Click on Element mobile    ${btn_Sign_In_Android}

User enters valid username "${username}"
    [Documentation]    Enter a valid username in the username field
    Click on Element mobile    ${input_field_Username_Android}
    Fill Text Input mobile     ${input_field_Username_Android}    ${username}
    Click on Element mobile    ${Title_UserName_Android}

User enters invalid password "${password}"
    [Documentation]    Enter an invalid password in the password field
    Click on Element mobile    ${Show_eye_password_Android}
    Click on Element mobile    //android.widget.EditText[@text="${Min_textPassword}"]
    Clear Text                 //android.widget.EditText[@text="${Min_textPassword}"]
    Click on Element mobile    ${input_field_password_Android}
    Fill Text Input mobile     ${input_field_password_Android}    ${password}
    Click on Element mobile    ${Title_Password_Android}

User enters valid email "${email}"
    [Documentation]    Enter a valid email address in the username field
    Click on Element mobile     //android.widget.EditText[@text="${Valid_UserID}"]
    Clear Text                  //android.widget.EditText[@text="${Valid_UserID}"]
    Click on Element mobile     ${input_field_Username_Android}
    Fill Text Input mobile      ${input_field_Username_Android}    ${email}
    Click on Element mobile     ${Title_UserName_Android}

User enters valid password "${password}"
    [Documentation]    Enter a valid password in the password field
    Click on Element mobile     //android.widget.EditText[@text="${Invalid_Password}"]
    Clear Text                  //android.widget.EditText[@text="${Invalid_Password}"]
    Click on Element mobile     ${input_field_password_Android}
    Fill Text Input mobile      ${input_field_password_Android}    ${password}
    Click on Element mobile     ${Title_Password_Android}

User clicks Sign Out button
    [Documentation]    Click the sign out button to initiate logout
    Sleep    2s
    Click on Element mobile     ${elm_Sign_Out_Android}

User confirms logout action
    [Documentation]    Confirm the logout action in the confirmation dialog
    Click on Element mobile     ${elm_confirm_Yes_Android}

# Then Keywords
System should display empty field validation errors for both username and password
    [Documentation]    Verify that appropriate error messages are displayed for empty fields
    Check validation error message Android    ${Valid_emty1_Android}    ${Expected_emptyfield}
    Check validation error message Android    ${Valid_emty2_Android}    ${Expected_emptyfield}

System should display minimum password length error message
    [Documentation]    Verify that error message for minimum password length is displayed
    Check validation error message Android    ${elm_error_minPassword_Android}   ${Expected_MinPassword_Android}

System should display login failed error message
    [Documentation]    Verify that error message for failed login is displayed
    Check validation error message Android    ${elm_error_loginfailed_Android}    ${Expected_error_loginfailed}

User should be successfully logged in and redirected to main screen
    [Documentation]    Verify that user is successfully logged in and redirected
    Check validation error message Android    ${elm_Change_position_Android}    ${Expected_Change_position}

User should be logged out and redirected to login screen
    [Documentation]    Verify that user is successfully logged out and returned to login screen
    Check validation error message Android    ${Title_Sign_In_Android}    ${Content_Sign_In_Android} 