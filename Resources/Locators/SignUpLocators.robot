*** Variables ***
############## IOS Sign Up Locators ##############
${Role_Salon}    //XCUIElementTypeStaticText[@name="SALON\n Sign In"]
${elm_error_invalid_PhoneNumber_iOS}    //XCUIElementTypeStaticText[@name="Invalid format Phone Number"]
${Expected_invalid_PhoneNumber_iOS}     Invalid format Phone Number

${Long_address}            Life is like a book, and each day is a new page. We write our own stories, create our own adventures, and overcome obstacles. The journey is as important as the destination, and the lessons we learn shape who we become. Stay curious and keep moving forward
${Long_address1}           Life is like a book, and each day is a new page. We write our own stories, create our own adventures, and overcome obstacles. The journey is as important as the destination, and the lessons we learn shape who we become. Stay curious and keep moving forwardaaa
${Long_AboutUs}            Life is filled with challenges and opportunities. Every day, we learn and grow from our experiences, whether they are joyful or tough. What matters most is how we face these challenges. If we stay confident in ourselves and never give up, every difficulty becomes a stepping stone toward success. Live with passion, perseverance, and a heart full of hope. Embrace each moment, for it's the journey that truly shapes who we are. Keep moving forward, and you'll reach your goals.aaaaaaaeqryebaasdyaajhdudhdan
${elm_SignUp_iOS}          //XCUIElementTypeStaticText[@name="Sign Up"]
${btn_Next_iOS}            //XCUIElementTypeStaticText[@name="Next"]

${elm_input_Email_iOS}              //XCUIElementTypeTextField[@name="Enter Email"]
${elm_error_Email_invalid_iOS}      //XCUIElementTypeStaticText[@name="Email invalid"]
${Expected_Email_invalid_iOS}       Email invalid
${elm_error_input_field_iOS}        //XCUIElementTypeStaticText[@name="This field is required"]
${elm_error_validation_iOS_1}       xpath=(//XCUIElementTypeStaticText[@name="This field is required"])[1]
${Expected_error_validation_iOS}    This field is required
${elm_show_eye_newPassword_iOS}     xpath=(//XCUIElementTypeImage)[2]
${elm_input_NewPassword_iOS}        xpath=(//XCUIElementTypeTextField[@name="Enter Password"])[1]
${elm_input_NewPassword_iOS_2}      //XCUIElementTypeTextField[@name="Enter Password"]
${elm_Title_Account_iOS}            //XCUIElementTypeStaticText[@name="Account"]
${elm_error_minPassword_iOS}        xpath=//XCUIElementTypeStaticText[@name="Password must be 8 characters or longer!"]
${Expected_error_minPassword_iOS}   Password must be 8 characters or longer!
${elm_error_rule_iOS}               xpath=//XCUIElementTypeStaticText[@name="Password have a least 1 special character, 1 number, 1 normal character, 1 capital character"]
${Expected_rule_iOS}                Password have a least 1 special character, 1 number, 1 normal character, 1 capital character
${elm_error_samePassword_iOS}       xpath=//XCUIElementTypeStaticText[@name="Confirm password must be the same as password!"]
${Expected_samePassword_iOS}        Confirm password must be the same as password!
${elm_show_eye_confirmPassword_iOS}     xpath=(//XCUIElementTypeImage)[4]
${elm_email_exist_iOS}              //XCUIElementTypeStaticText[@name="The email address already existing."]
${Expected_email_exist_iOS}         The email address already existing.

${elm_input_FirstName_iOS}         //XCUIElementTypeTextField[@name="Enter first name"]
${elm_input_LastName_iOS}         //XCUIElementTypeTextField[@name="Enter last name"]

${elm_Title_Personal_iOS}         xpath=(//XCUIElementTypeStaticText[@name="Personal Information"])[1]

${elm_Title_Business_iOS}         xpath=(//XCUIElementTypeStaticText[@name="Business Information"])[1]
${Expected_Title_Business_iOS}    Business Information

${elm_input_StoreName_iOS}         //XCUIElementTypeTextField[@name="Enter store name"]

${elm_input_StressAddress_iOS}      //XCUIElementTypeTextField[@name="Enter street address"]

${elm_btn_Submit_iOS}          //XCUIElementTypeStaticText[@name="Submit"]
${elm_btn_Clear_iOS}           //XCUIElementTypeStaticText[@name="Clear"]
${elm_btn_Done_iOS}            //XCUIElementTypeStaticText[@name="Done"]

${elm_input_aboutUs_iOS}       //XCUIElementTypeTextField[@name="Enter about us"]
${elm_Title_aboutUs_iOS}       //XCUIElementTypeStaticText[@name="About us"]

${elm_input_City_iOS}         //XCUIElementTypeTextField[@name="Enter city"]

${elm_error_invalid_PhoneNumber}        //XCUIElementTypeStaticText[@name="Invalid format Phone Number"]
${Expected_invalid_PhoneNumber}         Invalid format Phone Number

${elm_input_PhoneNumber_iOS}         //XCUIElementTypeOther[@name="Enter phone number"]

${elm_min_Character_iOS}             //XCUIElementTypeStaticText[@name="This field must have at least 2 characters"]
${Expected_min_Character_iOS}          This field must have at least 2 characters

${elm_max_Character_iOS}                         //XCUIElementTypeStaticText[@name="This field mustn't be 32 characters"]
${Expected_max_Character_iOS}                    This field mustn't be 32 characters

${elm_error_PhoneNumber_Exists_iOS}              //XCUIElementTypeStaticText[@name="Phone number already exists."]
${Expected_error_PhoneNumber_Exists_iOS}         Phone number already exists.

${elm_error_255Characters_iOS}                  //XCUIElementTypeStaticText[@name="This field mustn't be 255 characters"]
${Expected_error_255Characters_iOS}             This field mustn't be 255 characters

${elm_error_AboutUs_iOS}              //XCUIElementTypeStaticText[@name="This field mustn't be 500 characters"]
${Expected_error_AboutUs_iOS}         This field mustn't be 500 characters

${elm_Choose_Image_iOS}    xpath=//XCUIElementTypeStaticText[contains(@name, "Choose an image") and contains(@name, "Select file")]
${elm_Title_RegisterSuccess_iOS}       //XCUIElementTypeStaticText[@name="Registration has been successfully completed."]
${Expected_RegisterSuccess_iOS}        Registration has been successfully completed.

############## ANDROID Sign Up Locators ##############
${Role_Salon_Android}               //android.view.View[contains(@content-desc, "SALON")]
${elm_SignUp_Android}          //android.view.View[@content-desc="Sign Up"]
${btn_Next_Android}            //android.view.View[@content-desc="Next"]

${elm_input_Email_Android}              //android.widget.EditText[contains(@hint, "Email")]
${elm_error_Email_invalid_Android}      //android.view.View[contains(@content-desc, "Email invalid")]
${Expected_Email_invalid_Android}       Email invalid
${elm_error_input_field_Android}        //android.view.View[contains(@content-desc, "This field is required")]
${elm_error_validation_Android_1}       xpath=(//android.view.View[@content-desc="This field is required"])[1]
${Expected_error_validation_Android}    This field is required
${elm_show_eye_newPassword_Android}        xpath=(//android.widget.EditText[@hint="Enter Password"])[1]/android.widget.ImageView
${elm_input_NewPassword_Android}           xpath=(//android.widget.EditText[@hint="Enter Password"])[1]
${elm_input_NewPassword_Android_2}         xpath=(//android.widget.EditText[@hint="Enter Password"])[1]
${elm_Title_Account_Android}            //android.view.View[@content-desc="Account"]
${elm_error_minPassword_Android}        //android.view.View[contains(@content-desc, "Password must be 8 characters or longer!")]
${Expected_error_minPassword_Android}   Password must be 8 characters or longer!
${elm_error_rule_Android}               //android.view.View[contains(@content-desc, "Password have a least 1 special character")]
${Expected_rule_Android}                Password have a least 1 special character, 1 number, 1 normal character, 1 capital character
${elm_error_samePassword_Android}       //android.view.View[contains(@content-desc, "Confirm password must be the same as password!")]
${Expected_samePassword_Android}        Confirm password must be the same as password!
${elm_show_eye_confirmPassword_Android}    xpath=(//android.widget.EditText)[3]/android.widget.ImageView
${elm_email_exist_Android}              //android.view.View[contains(@content-desc, "The email address already existing.")]
${Expected_email_exist_Android}         The email address already existing.

${elm_input_FirstName_Android}         //android.widget.EditText[@hint="Enter first name"]
${elm_input_LastName_Android}          //android.widget.EditText[@hint="Enter last name"]  


${elm_Title_Personal_Android}         xpath=(//android.view.View[@content-desc="Personal Information"])[1]
${elm_Title_Business_Android}         xpath=(//android.view.View[@content-desc="Business Information"])[1]
${Expected_Title_Business_Android}    Business Information

${elm_input_StoreName_Android}         //android.widget.EditText[@hint="Enter store name"]
${elm_input_StressAddress_Android}     //android.widget.EditText[@hint="Enter street address"]

${elm_btn_Submit_Android}          //android.view.View[@content-desc="Submit"]
${elm_btn_Clear_Android}           //android.view.View[@content-desc="Clear"]
${elm_btn_Done_Android}            //android.view.View[@content-desc="Done"]

${elm_input_aboutUs_Android}       //android.widget.EditText[@hint="Enter about us"]
${elm_Title_aboutUs_Android}       //android.view.View[@hint="About us"]

${elm_input_City_Android}         //android.widget.EditText[@hint="Enter city"]

${elm_error_invalid_PhoneNumber_Android}        //android.view.View[contains(@content-desc, "Invalid format Phone Number")]
${Expected_invalid_PhoneNumber_Android}         Invalid format Phone Number

${elm_input_PhoneNumber_Android}         //android.view.View[@hint="Enter phone number"]

${elm_min_Character_Android}             //android.view.View[@content-desc="This field must have at least 2 characters"]
${Expected_min_Character_Android}        This field must have at least 2 characters

${elm_max_Character_Android}             //android.view.View[contains(@content-desc, "This field mustn't be 32 characters")]
${Expected_max_Character_Android}        This field mustn't be 32 characters

${elm_error_PhoneNumber_Exists_Android}              //android.view.View[contains(@content-desc, "Phone number already exists.")]
${Expected_error_PhoneNumber_Exists_Android}         Phone number already exists.

${elm_error_255Characters_Android}                  //android.view.View[@content-desc="This field mustn't be 255 characters"]
${Expected_error_255Characters_Android}             This field mustn't be 255 characters

${elm_error_AboutUs_Android}              //android.view.View[contains(@content-desc, "This field mustn't be 500 characters")]
${Expected_error_AboutUs_Android}         This field mustn't be 500 characters

${elm_Choose_Image_Android}    //android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]
${elm_Title_RegisterSuccess_Android}       //android.view.View[contains(@content-desc, "Registration has been successfully completed.")]
${Expected_RegisterSuccess_Android}        Registration has been successfully completed.

