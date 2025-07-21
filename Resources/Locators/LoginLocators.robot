*** Variables ***
#elements Login
${input_UserID}     //input[@id='user_code']
${input_Password}   //input[@id='password']
${btn_SignIn}       //button[@type='submit']
${btn_Logout}       //div[contains(text(),"Logout")]

#elements message Expected Result Login successfully
${EXPECTED_ERROR_Sucess_Payload}    true
${EXPECTED_SUCCESS_MESSAGE}  Daily Batch Report
${EXPECTED_SUCCESS_MESSAGE_API}    SIGN_IN_SUCCESSFULLY

#elements message Expected Result Logout successfully
${elm_Logout}      //h1[normalize-space()='Welcome!']
${EXPECTED_SUCCESS_LOGOUT}  Welcome!
${Expected_message_Signout}    Sign out successfully

#elements message Expected Result Login Failed
${elm_error_message}        //div[contains(text(),'Incorrect User ID or Password')]
${EXPECTED_ERROR_MESSAGE}    Incorrect User ID or Password
#Error Payload
${EXPECTED_ERROR_False_Payload}    False
${EXPECTED_ERROR_MESSAGE_SignIn_Payload}    AUTHENTICATION_FAILED
#Error API
${EXPECTED_ERROR_MESSAGE_API}   AUT001

#elements message Expected Result Login Failed with account inactive
${elm_error_message_inactive}        //div[contains(text(),'Account Deactivated. Please contact admin.')]
${EXPECTED_ERROR_MESSAGE_inactive}    Account Deactivated. Please contact admin.
${EXPECTED_ERROR_MESSAGE_API_inactive}    AUT014

#elements Error Message & Expected Result of Validation text UserID
${error_empty_UserID}     //p[contains(@id, ':r2:-form-item-message') and contains(text(), 'The User ID cannot be empty')]
${EXPECTED_ERROR_EmptyUserID}    The User ID cannot be empty

${error_invalid_UserID}     //p[contains(@id, ':r2:-form-item-message') and contains(text(), 'The User ID must be alphanumeric')]
${EXPECTED_ERROR_InvalidUserID}    The User ID must be alphanumeric

${error_min_UserID}     //p[contains(@id, ':r2:-form-item-message') and contains(text(), 'Username must be at least 5 characters.')]
${EXPECTED_ERROR_MinUserID}    Username must be at least 5 characters.

${error_max_UserID}     //p[contains(@id, ':r2:-form-item-message') and contains(text(), 'Username must be at most 20 characters.')]
${EXPECTED_ERROR_MaxUserID}    Username must be at most 20 characters.

#elements Error Message & Expected Result of Validation text Password
${error_empty_Password}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'The Password cannot be empty')]
${EXPECTED_ERROR_EmptyPassword}    The Password cannot be empty

${error_min_Password}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'Password must be at least 8 characters')]
${EXPECTED_ERROR_MinPassword}    Password must be at least 8 characters.

${error_Missing_Uppercase}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'Password must contain at least one uppercase letter.')]
${EXPECTED_Missing_Uppercase}    Password must contain at least one uppercase letter.

${error_Missing_Lowercase}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'Password must contain at least one lowercase letter.')]
${EXPECTED_Missing_Lowercase}    Password must contain at least one lowercase letter.

${error_Missing_OneNumber}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'Password must contain at least one number.')]
${EXPECTED_Missing_OneNumber}    Password must contain at least one number.

${error_Missing_OneSpecialCharacter}     //p[contains(@id, ':r3:-form-item-message') and contains(text(), 'Password must contain at least one special character.')]
${EXPECTED_Missing_OneSpecialCharacter}    Password must contain at least one special character.

# Varibale Endpoint API
${SIGNIN_API}     api/user/sign-in/
${Profile_API}    api/user/me/profile/
${SIGNOUT_API}    api/logout/


#######IOS Variables#######
${Role_Supplier}                //XCUIElementTypeStaticText[@name="SUPPLIER\n Sign In"]
${Role_Salon}                   //XCUIElementTypeStaticText[@name="SALON\n Sign In"]
${Title_Sign_In_iOS}            xpath=(//XCUIElementTypeStaticText[@name="Sign In"])[1]
${Content_Sign_In_iOS}          Sign In
${btn_Sign_In_iOS}              xpath=(//XCUIElementTypeStaticText[@name="Sign In"])[2]
${Valid_emty1}                  xpath=(//XCUIElementTypeStaticText[@name="This field is required"])[1]
${Valid_emty2}                  xpath=(//XCUIElementTypeStaticText[@name="This field is required"])[2]
${Expected_emptyfield}          This field is required
${input_field_Username_iOS}     //XCUIElementTypeTextField[@name="User Name"]
${Title_Username_iOS}           //XCUIElementTypeStaticText[@name="User Name"]

${input_field_password_iOS}     //XCUIElementTypeSecureTextField[@name="Password"]
${Title_Password_iOS}           //XCUIElementTypeStaticText[@name="Password"]
${input_field_password_iOS2}    //XCUIElementTypeTextField[@name="Password"]
${elm_error_minPassword_iOS}    //XCUIElementTypeStaticText[@name="Password must be 8 characters or longer!"]
${Expected_MinPassword_iOS}     Password must be 8 characters or longer!
${Show_eye_password_iOS}        xpath=(//XCUIElementTypeImage)[1]

${elm_error_loginfailed}        //XCUIElementTypeStaticText[@name="Login information is incorrect"]
${Expected_error_loginfailed}   Login information is incorrect

${elm_Change_position}           //XCUIElementTypeStaticText[@name="Change position"]
${Expected_Change_position}      Change position

${elm_Sign_Out_iOS}              //XCUIElementTypeStaticText[@name="Sign Out"]
${elm_confirm_Yes}               //XCUIElementTypeStaticText[@name="Yes"]

# Android locators (tối ưu cho Flutter)
${Role_Supplier_Android}            //android.widget.TextView[contains(@content-desc, "Supplier")]
${Role_Salon_Android}               //android.view.View[contains(@content-desc, "SALON")]
${Title_Sign_In_Android}            //android.view.View[contains(@content-desc, "Sign In")]
${Content_Sign_In_Android}          Sign In
${btn_Sign_In_Android}              //android.view.View[@content-desc="Sign In" and @clickable="true"]
${Valid_emty1_Android}              xpath=(//android.view.View[@content-desc="This field is required"])[1]
${Valid_emty2_Android}              xpath=(//android.view.View[@content-desc="This field is required"])[2]
${Expected_emptyfield_Android}      This field is required
${input_field_Username_Android}     //android.widget.EditText[contains(@hint, "User")]
${Title_UserName_Android}           //android.view.View[contains(@content-desc, "User")]
${input_field_password_Android}     //android.widget.EditText[contains(@hint, "Password")]
${Title_Password_Android}           //android.view.View[contains(@content-desc, "Password")]
${elm_error_minPassword_Android}    //android.view.View[contains(@content-desc, "Password must be 8 characters")]
${Expected_MinPassword_Android}     Password must be 8 characters or longer!
${Show_eye_password_Android}        //android.widget.EditText//android.widget.ImageView
${elm_error_loginfailed_Android}    //android.view.View[contains(@content-desc, "incorrect")]
${Expected_error_loginfailed_Android}     Login information is incorrect
${elm_Change_position_Android}            //android.view.View[contains(@content-desc, "Change position")]
${Expected_Change_position_Android}       Change position
${elm_Sign_Out_Android}                   //android.view.View[contains(@content-desc, "Sign Out")]
${elm_confirm_Yes_Android}                //android.view.View[contains(@content-desc, "Yes")]