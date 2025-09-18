*** Settings ***
Resource        ../../../TestKeyWords/Common.robot
Resource        ../../../Resources/Locators/TechnicianLocators.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android
Library    String
Library    OperatingSystem
Library    json
Library    Collections

*** Variables ***
${Long_FirstName_Tech}         Leo
${Long_LastName_Tech}          Kevinson
${Long_Address_Tech}           abbc

${Expected_error_minLength}    Minimum length is 2
${Expected_error_maxLength}    Maximum length exceeded
${Expected_email_invalid}      Email invalid
${elm_error_invalidPhone}      //android.view.View[@content-desc="Invalid format Phone Number"]
${Expected_phone_invalid}      Invalid format Phone Number

${Expected_success}                       Technician created successfully
${elm_btn_Submit_Technician_Android}      xpath=//android.view.View[@content-desc="Submit"]
${elm_btn_Done_Android}                   xpath=//android.view.View[@content-desc="Done"]
${elm_input_Email_Tech_Android}           xpath=//android.widget.EditText[@hint="Email"]
${elm_error_Email_Tech_Android}           xpath=//android.view.View[@content-desc="Email invalid"]
${elm_input_LastName_Tech_Android}        xpath=//android.widget.EditText[@hint="Last Name"]

${elm_ShowPassword_Android}                  xpath=//android.widget.EditText[@hint="Password"]/android.widget.ImageView
${elm_input_Password_Tech_Android}           xpath=//android.widget.EditText[@hint="Password"]
${elm_error_minPassword_Android}             //android.view.View[@content-desc="Password must be 8 characters or longer!"]
${Expected_minLengthPassword_Android}        Password must be 8 characters or longer!
${elm_error_invalidPassword_Android}         //android.view.View[@content-desc="Password have a least 1 special character, 1 number, 1 normal character, 1 capital character"]
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
${elm_email_exist_Tech_Android}                //android.view.View[@content-desc="User with this email already exists"]
${Expected_email_exist_Tech_Android}          User with this email already exists
*** Test Cases ***
# Random String Generation
#     ${Random_String}=    Generate Random String    5    [LETTERS]
#     Log    Generated Random String: ${Random_String}
#     ${Firstname}=    Catenate    SEPARATOR=    TestFirstName_    ${Random_String}
#     ${Lastname}=     Catenate    SEPARATOR=    TestLastName_     ${Random_String}
#     ${Email}=        Catenate    SEPARATOR=    test_            ${Random_String}@yopmail.com
#     Log    ${Firstname}
#     Log    ${Lastname}
#     Log    ${Email}    
#     ${random_name}=   Get Length    ${Random_String}
#     Log    Length of Random String: ${random_name}
    
Navigate to Create Technician Page
    Click on Element mobile    ${btn_OpenCreateTechnician}

### Income Rate Validation Tests ###
Check Income Rate empty
    Click on Element mobile     ${elm_input_IncomeRate_Tech_Android}
    Click on Element mobile    xpath=//android.view.View[@content-desc="Done"]
    # Click on Element mobile    xpath=//android.view.View[@content-desc="Submit"]
    # Swipe    894    110    905    543
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check valid Income Rate
    Click on Element mobile     ${elm_input_IncomeRate_Tech_Android}
    Enter NumberPad Amount      1    0    0    0
    Click on Element mobile     ${elm_btn_Done_Android}
    AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}

### First Name Validation Tests ###scontainer
Check First Name empty
    Swipe    905    740    903    213
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    ${EMPTY}
    Click on Element mobile    //android.view.View[@content-desc=" First Name"]
    Click on Element mobile    ${elm_btn_Submit_Technician_Android}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check First Name min length
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    a
    Check validation error message Android   ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Check Valid First Name
    Click And Clear Field      a
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    ${Long_FirstName_Tech}
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

# ### Email Validation Tests ###
Check Email empty
    Click on Element mobile    ${elm_input_Email_Tech_Android}
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    ${EMPTY}
    Check validation error message Android   ${elm_Empty_error_Android}    ${Expected_error_required}

Check email missing @
    Click on Element mobile    ${elm_input_Email_Tech_Android}
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    userexample.com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email missing local part
    Click And Clear Field      userexample.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    @example.com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email missing domain     
    Click And Clear Field      @example.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user@
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email contains spaces
    Click And Clear Field        user@
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user @example.com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email contains special characters
    Click And Clear Field     user @example.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user!
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email multiple @
    Click And Clear Field     user!
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user@@example.com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email multiple dots in domain
    Click And Clear Field     user@@example.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user@example..com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email dot at start of domain
    Click And Clear Field     user@example..com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user@.example.com
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

Check email dot at end of domain
    Click And Clear Field     user@.example.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    user@example.
    Check validation error message Android    ${elm_error_Email_Tech_Android}    ${Expected_email_invalid}

# ### Address Validation Tests ###
# Check Address min length
#     Clear Text mobile          ${elm_input_Address_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Address_Tech_Android}    a
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_Address_Tech_Android}    ${Expected_error_minLength}

# Check Address max length
#     Clear Text mobile          ${elm_input_Address_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Address_Tech_Android}    ${Long_Address_Tech}
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_Address_Tech_Android}    ${Expected_error_maxLength}

# ### Last Name Validation Tests ###
Check Last Name empty
    Click on Element mobile          ${elm_input_LastName_Tech_Android}
    Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    ${EMPTY}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check Last Name min length
    Click on Element mobile          ${elm_input_LastName_Tech_Android}
    Fill Text Input mobile           ${elm_input_LastName_Tech_Android}    b
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Check Valid Last Name 
    Click And Clear Field          b
    Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    ${Long_LastName_Tech}
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}


# ### Password Validation Tests ###
Check Password empty
    Click on Element mobile         ${elm_ShowPassword_Android}
    Click on Element mobile         ${elm_input_Password_Tech_Android}
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    ${EMPTY}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check Password min length
    Click on Element mobile         ${elm_input_Password_Tech_Android}
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    a
    Check validation error message Android    ${elm_error_minPassword_Android}    ${Expected_minLengthPassword_Android}

Check Password Missing Uppercase
    Click And Clear Field           a
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    password1!
    Check validation error message Android    ${elm_error_invalidPassword_Android}    ${Expected_invalidPassword_Android}

Check Password Missing Lowercase
    Click And Clear Field           password1!
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    PASSWORD1!
    Check validation error message Android    ${elm_error_invalidPassword_Android}    ${Expected_invalidPassword_Android}

Check Password Missing Number
    Click And Clear Field           PASSWORD1!
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    Password!
    Check validation error message Android    ${elm_error_invalidPassword_Android}    ${Expected_invalidPassword_Android}

Check Password Missing Special Character
    Click And Clear Field           Password!
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    Password1
    Check validation error message Android    ${elm_error_invalidPassword_Android}    ${Expected_invalidPassword_Android}

Check Valid Password
    Click And Clear Field           Password1
    Fill Text Input mobile          ${elm_input_Password_Tech_Android}    Password1!
    AppiumLibrary.Page Should Not Contain Element    ${elm_error_invalidPassword_Android}

Check Re-Enter Password empty
    Click on Element mobile         //android.view.View[@content-desc=" Re-enter Password"]
    Click on Element mobile         ${elm_Show_ReEnterPassword_Android}
    Click on Element mobile         ${elm_input_RePassword_Tech_Android}
    Fill Text Input mobile          ${elm_input_RePassword_Tech_Android}    ${EMPTY}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check Re-Enter Password mismatch
    Click on Element mobile         ${elm_input_RePassword_Tech_Android}
    Fill Text Input mobile     ${elm_input_RePassword_Tech_Android}  Password2!
    Check validation error message Android    ${elm_error_missMatch_Password}    ${Expected_password_mismatch}

Check Valid Re-Enter Password
    Click And Clear Field           Password2!
    Fill Text Input mobile          ${elm_input_RePassword_Tech_Android}    Password1!
    AppiumLibrary.Page Should Not Contain Element    ${elm_error_missMatch_Password}

Check Nick Name empty
    Click on Element mobile         ${elm_input_NickName_Tech_Android}
    Fill Text Input mobile          ${elm_input_NickName_Tech_Android}    ${EMPTY}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check Nick Name min length
    Click on Element mobile         ${elm_input_NickName_Tech_Android}
    Fill Text Input mobile          ${elm_input_NickName_Tech_Android}    a
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Check Valid Nick Name
    Click And Clear Field           a
    Fill Text Input mobile          ${elm_input_NickName_Tech_Android}    Nickname
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}


### Phone Validation Tests ###
Check Phone empty
    Click on Element mobile         //android.view.View[@content-desc=" Phone Number"]
    Click on Element mobile         ${elm_input_Phone_Tech_Android}
    Click on Element mobile         ${btn_Done}
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

Check Phone min length
    Click on Element mobile         ${elm_input_Phone_Tech_Android}
    Enter NumberPad Amount          1    2    3
    Click on Element mobile         ${btn_Done}
    Check validation error message Android    ${elm_error_invalidPhone}    ${Expected_phone_invalid}

Check Valid Invalid Phone
    Click on Element mobile         //android.view.View[@text="(123"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          1    2    3    4    5    6    7    8    9    0
    Click on Element mobile         ${btn_Done}
    Check validation error message Android    ${elm_error_invalidPhone}    ${Expected_phone_invalid}

Check Valid Phone
    Click on Element mobile         //android.view.View[@text="(123) 456-7890"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          9    2    3    4    5    6    7    8    9    0
    Click on Element mobile         ${btn_Done}
    AppiumLibrary.Page Should Not Contain Element    ${elm_error_invalidPhone}

Check Gender
    Click on Element mobile         //android.view.View[@content-desc="Gender"]
    Click on Element mobile         //android.view.View[@content-desc="Male"]
    Click on Element mobile         ${btn_Submit}
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="This field is required"]


# ### Check Email Already Exists ###
Check email address exist
    Click And Clear Field        user@example.
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    school@yopmail.com
    Click on Element mobile    //android.view.View[@content-desc=" Email"]
    Click on Element mobile         ${btn_Submit}
    Check validation error message Android    ${elm_email_exist_Tech_Android}    ${Expected_email_exist_Tech_Android}

## Valid Technician Creation ##
Check Valid Technician Creation successfully
    Click And Clear Field        school@yopmail.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    kevin17ss@yopmail.com
    Click on Element mobile    //android.view.View[@content-desc=" Email"]
    AppiumLibrary.Wait Until Element Is Visible    ${btn_Submit}   5s
    Click on Element mobile         ${btn_Submit}
    Check validation error message Android    //android.view.View[@content-desc="Technician Successfully Created"]    Technician Successfully Created

*** Keywords ***
Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}" and @clickable="true"]
    END
    