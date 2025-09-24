*** Variables ***
### Android Locators ###
${btn_OpenCreateTechnician}          xpath=//android.view.View[@content-desc="Add New Technician"]
${btn_Submit}                        xpath=//android.view.View[@content-desc="Submit"]
${btn_Cancel_CreateTechnician}       xpath=//button[normalize-space()="Cancel"]
${btn_Done}                          xpath=//android.view.View[@content-desc="Done"]
${btn_Clear}                         xpath=//android.view.View[@content-desc="Clear"]
${btn_Select}                        xpath=//android.view.View[@content-desc="Select"]

${elm_input_IncomeRate_Tech_Android}    xpath=//android.view.View[contains(@hint, "Income Rate")]
${elm_input_FirstName_Tech_Android}     xpath=//android.widget.EditText[@hint="First Name"]

${Expected_email_invalid}      Email invalid
${elm_error_invalidPhone}      xpath=//android.view.View[@content-desc="Invalid format Phone Number"]
${Expected_phone_invalid}      Invalid format Phone Number

${elm_input_Email_Tech_Android}           xpath=//android.widget.EditText[@hint="Email"]
${elm_error_Email_Tech_Android}           xpath=//android.view.View[@content-desc="Email invalid"]
${elm_input_LastName_Tech_Android}        xpath=//android.widget.EditText[@hint="Last Name"]

${elm_ShowPassword_Android}                  xpath=//android.widget.EditText[@hint="Password"]/android.widget.ImageView
${elm_input_Password_Tech_Android}           xpath=//android.widget.EditText[@hint="Password"]
${elm_error_minPassword_Android}             xpath=//android.view.View[@content-desc="Password must be 8 characters or longer!"]
${Expected_minLengthPassword_Android}        Password must be 8 characters or longer!
${elm_error_invalidPassword_Android}         xpath=//android.view.View[@content-desc="Password have a least 1 special character, 1 number, 1 normal character, 1 capital character"]
${Expected_invalidPassword_Android}          Password have a least 1 special character, 1 number, 1 normal character, 1 capital character

${elm_Show_ReEnterPassword_Android}            xpath=//android.widget.EditText[@hint="Re-enter Password"]/android.widget.ImageView
${elm_input_RePassword_Tech_Android}           xpath=//android.widget.EditText[@hint="Re-enter Password"]
${elm_error_missMatch_Password}                xpath=//android.view.View[@content-desc="Confirm password must be the same as password!"]
${Expected_password_mismatch}                  Confirm password must be the same as password!

${elm_input_NickName_Tech_Android}             xpath=//android.widget.EditText[@hint="Nick name"]

${elm_input_Phone_Tech_Android}                xpath=//android.view.View[@hint="Phone Number"]

${elm_Empty_error_Android}                     xpath=(//android.view.View[@content-desc="This field is required"])[1]
${Expected_error_required}                     This field is required
${elm_minLength_error_Android}                 xpath=//android.view.View[@content-desc="This field must be 2 characters or longer!"]
${Expected_minLength_error_Android}            This field must be 2 characters or longer!
${elm_email_exist_Tech_Android}                xpath=//android.view.View[@content-desc="User with this email already exists"]
${Expected_email_exist_Tech_Android}           User with this email already exists

${elm_Phone_exist_Tech_Android}                xpath=//android.view.View[@content-desc="Phone number already exists."]
${Expected_Phone_exist_Tech_Android}           Phone number already exists.

${elm_Create_Technician_Success_Android}              xpath=//android.view.View[@content-desc="Technician Successfully Created"]    
${Expected_Create_Technician_Success_Android}         Technician Successfully Created
${elm_input_Address_Tech_Android}                 xpath=//android.widget.EditText[@hint="Address"]
${elm_Title_Email_Tech_Android}                   xpath=//android.view.View[@content-desc=" Email"]
${elm_input_State_Tech_Android}                   xpath=//android.widget.EditText[@hint="State"]
${elm_input_City_Tech_Android}                    xpath=//android.widget.EditText[@hint="City"]
${elm_input_Zipcode_Tech_Android}                 xpath=//android.view.View[@hint="Zipcode"]
# ${elm_input_Dob_Tech_Android}                     xpath=//android.view.View[@hint="Date of Birth"]
${elm_input_Dob_Tech_Android}                     xpath=//android.view.View[@bounds="[692,552][1335,626]"]

@{phoneNumber_exists}                             9    2    3    4    5    6    7    8    9    0
${Type_Salary}                                    'salary'
${Type_Services}                                  'services'
### Update Technician Android Locators ###
${btn_Update_Technician_Android}                    xpath=//android.view.View[@content-desc="Update Information"]
${elm_Update_Technician_Success_Android}              xpath=//android.view.View[@content-desc="Updated the technician successfully"]
${Expected_Create_Technician_Success_Android}         Updated the technician successfully