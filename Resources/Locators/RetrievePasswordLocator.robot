*** Variables ***
${elm_A_RetrivePassword}   //a[normalize-space()='Retrieve password']
${elm_H1_RetrivePassword}   //h1[normalize-space()='Retrieve Password']
${Expected_H1_RetrivePassword}   Retrieve Password
${input_UserID_Retrive}   //input[@placeholder='User ID']
${btn_Submit_Retrive}   //button[normalize-space()='Submit']
${btn_radio_Email}      //button[@value='EMAIL']
${btn_radio_SMS}      (//button[@value='PHONE_NUMBER'])
${btn_Confirm_Retrive}   //button[normalize-space()='Confirm']
${btn_Verify_Retrive}   //button[normalize-space()='Verify']
${elm_input_OTP}        //input[@class='disabled:cursor-not-allowed']
${input_NewPassword}   //input[@placeholder='New Password']
${input_ConfirmPassword}   //input[@placeholder='Confirm New Password']

## Elements
${elm_message}      //div[@class='text-sm opacity-90']
${error_empty_OTP}          //p[contains(@class, 'text-sm') and contains(text(), 'OTP code is required')]
${EXPECTED_OTP code is required}       OTP code is required
### Get success, Get failed, Get Retrieve Password success
${EXPECTED_CheckToken_Success}    OTP verified successfully. Redirecting to reset password...
${EXPETCTED_Message_Retrieve_Success}    Your password has been reset successfully.
#Error Elements
${EXPECTED_RERROR_MESSAGE_USERINVALID}    User not found
${EXPECTED_• The OTP you entered is incorrect. Please try again}       • The OTP you entered is incorrect. Please try again
${EXPECTED_• New password cannot be the same as current password}       • New password cannot be the same as current password
#Error Elements validation text
${elm_error_validationtext}   //p[contains(@id, ':r8:-form-item-message')]
${EXPECTED_ERROR_EmptyUserID}   User ID is required
${EXPECTED_ERROR_InvalidUserID}    User ID must contain only alphanumeric characters
${EXPECTED_ERROR_MinUserID}    User ID must be between 5 and 20 characters
${EXPECTED_ERROR_MaxUserID}    User ID must be between 5 and 20 characters

#Error Elements validation text Password
${error_empty_New_Password}     //p[contains(@class, 'text-sm') and contains(text(), 'The Password cannot be empty')]
${error_Min_New_Password}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must be at least 8 characters.')]
${error_Missing_Uppercase}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must contain at least one uppercase letter.')]
${error_Missing_Lowercase}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must contain at least one lowercase letter.')]
${error_Missing_OneNumber}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must contain at least one number.')]
${error_Missing_OneSpecialCharacter}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must contain at least one special character.')]

${error_empty_Confirm_New_Password}     //p[contains(@class, 'text-sm') and contains(text(), 'Required')]
${error_Min_Confirm_New_Password}     //p[contains(@class, 'text-sm') and contains(text(), 'Password must be at least 8 characters')]
${error_Confirm_New_Password_NotMatch}     //p[contains(@class, 'text-sm') and contains(text(), 'Passwords do not match')]

${EXPECTED_ERROR_EmptyPassword}    The Password cannot be empty
${EXPECTED_ERROR_MinPassword}    Password must be at least 8 characters.
${EXPECTED_Missing_Uppercase}    Password must contain at least one uppercase letter.
${EXPECTED_Missing_Lowercase}    Password must contain at least one lowercase letter.
${EXPECTED_Missing_OneNumber}    Password must contain at least one number.
${EXPECTED_Missing_OneSpecialCharacter}    Password must contain at least one special character.
${EXPTECTED_empty_ConfirmPassword}      Required
${EXPECTED_ERROR_MinConfirmPassword}    Password must be at least 8 characters
${EXPECTED_ConfirmPassword_NotMatch}    Passwords do not match
#Error Payload
${EXPECTED_MESSAGE_Retrieve_Payload}    GET_DATA_SUCCEEDED
${EXPECTED_INVALID_INPUT}       INVALID_INPUT

#Error API
${EXPECTED_ERROR_MESSAGE_Usernotexist}   VAL233
${EXPECTED_ERROR_MESSAGE_Tokeninvalid}  VAL643
${EXPECTED_ERROR_MESSAGE_NotPhoneNumber}  VAL636
#Success API
${EXPECTED_SUCCESS_MESSAGE_Retrieve}    Retrive your password successfully
${EXPECTED_TOKEN_API_Success}           Your token is correct
# Varibale Endpoint API
${CheckUserID_API}     api/v2/retrive/user-info/?user_id=
${SENDOTP_API}     api/v2/retrive/send-otp/
${CheckToken_API}     api/v2/retrive/check-token/
${RetrivePassword_API}     api/v2/retrive/password/


##########IOS Variables
${elm_forgot_password_iOS}      //XCUIElementTypeStaticText[@name="Forgot password?"]
${elm_btn_continue_iOS}         //XCUIElementTypeStaticText[@name="Continue"]
${elm_error_empty_email_iOS}    xpath=//XCUIElementTypeImage[contains(@name, "Email") and contains(@name, "This field is required")]
${Expected_emty_field_iOS}      This field is required
${elm_input_field_email_iOS}    //XCUIElementTypeTextField[@name="Email"]

${elm_error_email_not_exist_iOS}    //XCUIElementTypeImage[contains(@name, "Email") and contains(@name, "Email does not exist")]
${Expected_email_not_exist_iOS}     Email does not exist

${elm_empty_field_iOS}                  xpath=//XCUIElementTypeOther[@name="New Password\n *\nThis field is required\nConfirm Password\n *\nThis field is required"]
${elm_show_eye_new_password_iOS}        xpath=(//XCUIElementTypeImage)[1]
${elm_show_eye_confirm_password_iOS}    xpath=(//XCUIElementTypeImage)[2]
${elm_field_new_password_iOS}           //XCUIElementTypeTextField[@name="Password"]
${elm_field_confirm_password_iOS}       //XCUIElementTypeTextField[@name="Confirm Password"]
${elm_minNewPassword_iOS}               //XCUIElementTypeOther[contains(@name, "New Password") and contains(@name, "Confirm Password") and contains(@name, "Password must be 8 characters or longer")]
${elm_invalid_rule_password_iOS}        //XCUIElementTypeOther[contains(@name, "New Password") and contains(@name, "Confirm Password") and contains(@name, "Password have a least 1 special character") and contains(@name, "Confirm password must be the same as password")]

${Expected_minNewPassword_iOS}          Password must be 8 characters or longer
${Expected_invalid_rule_password_iOS}   Password have a least 1 special character
${Expected_confirm_password_iOS}        Confirm password must be the same as password

${elm_change_password_success_iOS}      //XCUIElementTypeStaticText[@name="Change Password Success"]
${Expected_Change_Password_Success_iOS}   Change Password Success

##########ANDROID Variables
${elm_forgot_password_android}           //android.view.View[@content-desc="Forgot password?"]
${elm_btn_continue_android}              //android.view.View[@content-desc="Continue"]
${elm_error_empty_email_android}         //android.view.View[contains(@content-desc, "This field is required")]
${Expected_emty_field_android}           This field is required
${elm_input_field_email_android}         //android.widget.EditText[contains(@hint, "Email")]
${elm_error_email_not_exist_android}     //android.view.View[contains(@content-desc, "Email does not exist")]
${Expected_email_not_exist_android}      Email does not exist
${elm_field_new_password_android}        //android.view.View[contains(@content-desc, "New Password")]/android.view.View[1]/android.widget.EditText
${elm_field_confirm_password_android}    //android.view.View[contains(@content-desc, "New Password")]/android.view.View[2]/android.widget.EditText
${elm_change_password_success_android}   //android.view.View[@content-desc="Change Password Success"]
${Expected_Change_Password_Success_android}   Change Password Success

${elm_show_eye_new_password_android}        xpath=//android.view.View[@content-desc="New Password\n *\nConfirm Password\n *"]/android.view.View[1]/android.widget.EditText/android.widget.ImageView
${elm_show_eye_confirm_password_android}    xpath=//android.view.View[@content-desc="New Password\n *\nConfirm Password\n *"]/android.view.View[2]/android.widget.EditText/android.widget.ImageView
${elm_error_empty_field_android}            //android.widget.ImageView[contains(@content-desc, "This field is required")]
${elm_minNewPassword_android}                //android.view.View[contains(@content-desc, "Password must be 8 characters or longer")]
${Expected_minNewPassword_android}            Password must be 8 characters or longer
${elm_invalid_rule_password_android}            //android.view.View[contains(@content-desc, "Password have a least 1 special character")]
${Expected_invalid_rule_password_android}        Password have a least 1 special character
${elm_error_notmust_password_android}            //android.view.View[contains(@content-desc, "Confirm password must be the same as password")]
${Expected_confirm_password_android}            Confirm password must be the same as password