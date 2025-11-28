*** Settings ***
Resource    ../../Locators/RetrievePasswordLocator.robot
Resource    ../../../TestData/RetrivePasswordData/RetrivePasswordData.robot
Resource    ../../../TestKeyWords/Common.robot
Library    Collections
Library    BuiltIn

*** Keywords ***
Verify New Password & Confirm Password iOS
    AppiumLibrary.Wait Until Element Is Visible    //XCUIElementTypeOther[contains(@name, "New Password") and contains(@name, "Confirm Password")]        120s
    #Check validation password empty
    Click on Element mobile     ${elm_show_eye_new_password_iOS}
    Click on Element mobile     ${elm_show_eye_confirm_password_iOS}
    Fill Text Input mobile      ${elm_field_new_password_iOS}    ${EMPTY}
    Click on Element mobile     ${elm_forgot_password_iOS}
    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_empty_field_iOS}    ${Expected_emty_field_iOS}

    #Check validation new password & confirm password too short
    Fill Text Input mobile     ${elm_field_new_password_iOS}   ab12
    Click on Element mobile     ${elm_forgot_password_iOS}

    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_minNewPassword_iOS}    ${Expected_minNewPassword_iOS}

#    #Check validation password missing uppercase
    Clear Text                  //XCUIElementTypeTextField[@value="ab12"]
    Fill Text Input mobile      ${elm_field_new_password_iOS}    password123!
    Click on Element mobile     ${elm_forgot_password_iOS}
    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_invalid_rule_password_iOS}     ${Expected_invalid_rule_password_iOS}

#    #Check validation password missing lowercase
    Clear Text                  //XCUIElementTypeTextField[@value="password123!"]
    Fill Text Input mobile      ${elm_field_new_password_iOS}    PASSWORD123!
    Click on Element mobile     ${elm_forgot_password_iOS}
    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_invalid_rule_password_iOS}     ${Expected_invalid_rule_password_iOS}

#    #Check validation password missing number
    Clear Text                  //XCUIElementTypeTextField[@value="PASSWORD123!"]
    Fill Text Input mobile      ${elm_field_new_password_iOS}    Password!
    Click on Element mobile     ${elm_forgot_password_iOS}
    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_invalid_rule_password_iOS}     ${Expected_invalid_rule_password_iOS}

#    #Check validation password missing special character
    Clear Text                  //XCUIElementTypeTextField[@value="Password!"]
    Fill Text Input mobile      ${elm_field_new_password_iOS}    Password123
    Click on Element mobile     ${elm_forgot_password_iOS}
    Click on Element mobile     ${elm_btn_continue_iOS}
    Should Contain              ${elm_invalid_rule_password_iOS}     ${Expected_invalid_rule_password_iOS}

#    #Check validation confirm password not match
    Fill Text Input mobile      ${elm_field_confirm_password_iOS}    Dev123!@#
    Execute Script              mobile: tap    x=418    y=103
    Click on Element mobile    ${elm_btn_continue_iOS}
    Should Contain             ${elm_invalid_rule_password_iOS}    ${Expected_confirm_password_iOS}

Verify New Password & Confirm Password Android
    AppiumLibrary.Wait Until Element Is Visible    //android.view.View[contains(@content-desc, "New Password") and contains(@content-desc, "Confirm Password")]    120s
    # Check validation password empty
    Click on Element mobile     ${elm_show_eye_new_password_android}
    Click on Element mobile     ${elm_show_eye_confirm_password_android}
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    ${EMPTY}
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_error_empty_field_android}    ${Expected_emty_field_android}

    # Check validation new password & confirm password too short
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}   ab12
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_minNewPassword_android}    ${Expected_minNewPassword_android}

    # Check validation password missing uppercase
                
    Click And Clear Field        ab12
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    password123!
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_invalid_rule_password_android}     ${Expected_invalid_rule_password_android}

    # Check validation password missing lowercase
    Click And Clear Field        password123!
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    PASSWORD123!
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_invalid_rule_password_android}     ${Expected_invalid_rule_password_android}

    # Check validation password missing number
    Click And Clear Field        PASSWORD123!
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    Password!
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_invalid_rule_password_android}     ${Expected_invalid_rule_password_android}

    # Check validation password missing special character
    Click And Clear Field        Password!
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    Password123
    Click on Element mobile     ${elm_forgot_password_android}
    Click on Element mobile     ${elm_btn_continue_android}
    Should Contain              ${elm_invalid_rule_password_android}     ${Expected_invalid_rule_password_android}

    # Check validation confirm password not match
    Click on Element mobile     ${elm_field_confirm_password_android}
    Fill Text Input mobile      ${elm_field_confirm_password_android}    Dev123!@#
    Click on Element mobile     ${elm_forgot_password_android}
    # Nếu cần tap ra ngoài để ẩn bàn phím, thêm dòng sau:
    # Execute Script    mobile: tap    x=418    y=103
    Click on Element mobile    ${elm_btn_continue_android}
    Should Contain             ${elm_error_notmust_password_android}    ${Expected_confirm_password_android}


##API Retrieve Password###
Check API userid invalid
    ${params}=    Create Dictionary    user_id=${userID_Invalid}
    ${response}=  API Request With Params   ${Method_GET}    ${URL_CheckUserID}    ${params}    ${Status_200}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${data_email}=    Get From Dictionary    ${json['data']}    email
    ${data_phonenumber}=    Get From Dictionary    ${json['data']}    phone_number
    Should Be Equal As Strings    ${data_email}    None
    Should Be Equal As Strings    ${data_phonenumber}    None

Check API userid valid with email & phone number
    ${params}=    Create Dictionary    user_id=${userID_Johny}
    ${response}=  API Request With Params   ${Method_GET}    ${URL_CheckUserID}    ${params}    ${Status_200}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${data_email}=    Get From Dictionary    ${json['data']}    email
    ${data_phonenumber}=    Get From Dictionary    ${json['data']}    phone_number
    Should Be Equal As Strings    ${data_email}   ${Email_Johny}
    Should Be Equal As Strings    ${data_phonenumber}    ${PhoneNumber_Johny}

Check API userid valid with email & not phone number
    ${params}=    Create Dictionary    user_id=${Valid_userID}
    ${response}=  API Request With Params   ${Method_GET}    ${URL_CheckUserID}    ${params}    ${Status_200}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${data_email}=    Get From Dictionary    ${json['data']}    email
    Should Be Equal As Strings    ${data_email}   ${Email_UserID_Valid}

Check API userid not phone number
    ${response}=  API Request   ${Method_PUT}    ${SendOTP_URL}    ${PAYLOAD_NotPhoneNumber}    ${Status_400}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${code}=    Get From Dictionary    ${json['data']}    user_id
    Should Contain    ${code}    ${EXPECTED_ERROR_MESSAGE_NotPhoneNumber}

Check API verify token invalid
    ${response}=  API Request    ${Method_PUT}    ${URL_Checktoken}    ${PAYLOAD_TokenInvalid}    ${Status_400}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${code}=    Get From Dictionary    ${json['data']}    token
    Should Contain    ${code}    ${EXPECTED_ERROR_MESSAGE_Tokeninvalid}

Check API send OTP, check token, retrieve password failed with same old password
    ${response}=  API Request   ${Method_PUT}    ${SendOTP_URL}    ${PAYLOAD_Faild_UserIdinactive}    ${Status_202}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${token}=    Get From Dictionary    ${json['data']}    token
    Should Contain    ${response.content}    ${EXPECTED_SUCCESS_MESSAGE_API}
    #Check token success API
    &{PAYLOAD_CheckToken}=     Create Dictionary     user_id=${userID_Schoolinactive}   token=${token}
    ${checktoken}=   API Request    ${Method_PUT}    ${URL_Checktoken}    ${PAYLOAD_CheckToken}    ${Status_200}
    Should Contain    ${checktoken.content}    ${EXPECTED_TOKEN_API_Success}
    # Retrieve password failed API with same old password
    &{PAYLOAD_RetriveFailed}=   Create Dictionary     user_id=${userID_Schoolinactive}   token=${token}   new_password=${Old_password}   confirm_new_password=${Old_password}
    ${retrieve_password}=   API Request   ${Method_PUT}   ${URL_Retrive}   ${PAYLOAD_RetriveFailed}   ${Status_400}
    Should Contain     ${retrieve_password.content}     ${EXPECTED_INVALID_INPUT}

Check API send OTP, check token, retrieve password success with phone number
    ${newpassword}=  Generate Secure Password
    ${confirmpassword}=    Set Variable    ${newpassword}
    #Send OTP success API
    ${response}=  API Request   ${Method_PUT}    ${SendOTP_URL}    ${PAYLOAD_SUCCESS_Phonenumber}    ${Status_202}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${token}=    Get From Dictionary    ${json['data']}    token
    Should Contain    ${response.content}    ${EXPECTED_SUCCESS_MESSAGE_API}
    #Check token success API
    &{PAYLOAD_CheckToken}=     Create Dictionary     user_id=${userID_Johny}   token=${token}
    ${checktoken}=   API Request    ${Method_PUT}    ${URL_Checktoken}    ${PAYLOAD_CheckToken}    ${Status_200}
    Should Contain    ${checktoken.content}    ${EXPECTED_TOKEN_API_Success}
    # Retrieve password success API
    &{PAYLOAD_RetriveSuccess}=    Create Dictionary     user_id=${userID_Johny}    token=${token}    new_password=${newpassword}    confirm_new_password=${confirmpassword}
    ${retrieve_password}=   API Request    ${Method_PUT}    ${URL_Retrive}    ${PAYLOAD_RetriveSuccess}    ${Status_200}
    Should Contain    ${retrieve_password.content}    ${EXPECTED_SUCCESS_MESSAGE_Retrieve}

Check API send OTP, check token, retrieve password success with email
    ${newpassword}=  Generate Secure Password
    ${confirmpassword}=    Set Variable    ${newpassword}
    #Send OTP success API
    ${response}=  API Request    ${Method_PUT}    ${SendOTP_URL}    ${PAYLOAD_SUCCESS_UserId}    ${Status_202}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${token}=    Get From Dictionary    ${json['data']}    token
    Should Contain    ${response.content}    ${EXPECTED_SUCCESS_MESSAGE_API}
    #Check token success API
    &{PAYLOAD_CheckToken}=     Create Dictionary     user_id=${Valid_userID}   token=${token}
    ${checktoken}=   API Request    ${Method_PUT}    ${URL_Checktoken}    ${PAYLOAD_CheckToken}    ${Status_200}
    Should Contain    ${checktoken.content}    ${EXPECTED_TOKEN_API_Success}
    # Retrieve password success API
    &{PAYLOAD_RetriveSuccess}=    Create Dictionary     user_id=${Valid_userID}    token=${token}    new_password=${newpassword}    confirm_new_password=${confirmpassword}
    ${retrieve_password}=   API Request    ${Method_PUT}    ${URL_Retrive}    ${PAYLOAD_RetriveSuccess}    ${Status_200}
    Should Contain    ${retrieve_password.content}    ${EXPECTED_SUCCESS_MESSAGE_Retrieve}