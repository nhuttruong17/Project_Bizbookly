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
${Long_FirstName_Tech}         abbc
${Long_LastName_Tech}          abbc
${Long_Address_Tech}           abbc
${Expected_error_required}     This field is required
${Expected_error_minLength}    Minimum length is 2
${Expected_error_maxLength}    Maximum length exceeded
${Expected_email_invalid}      Email invalid
${Expected_phone_invalid}      Please enter a valid phone number
${Expected_password_mismatch}  Passwords do not match
${Expected_success}            Technician created successfully
${elm_btn_Submit_Technician_Android}    xpath=//android.view.View[@content-desc="Submit"]
${elm_btn_Done_Android}               xpath=//android.view.View[@content-desc="Done"]
${elm_input_Email_Tech_Android}        xpath=//android.widget.EditText[contains(@hint, "Email")]
${elm_error_Email_Tech_Android}         xpath=//android.view.View[@content-desc="Email invalid"]
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
    Check validation error message Android    xpath=(//android.view.View[@content-desc="This field is required"])[1]    ${Expected_error_required}

Check valid Income Rate
    Click on Element mobile     ${elm_input_IncomeRate_Tech_Android}
    Enter NumberPad Amount      1    0    0    0
    Click on Element mobile     ${elm_btn_Done_Android}
    AppiumLibrary.Page Should Not Contain Element    xpath=(//android.view.View[@content-desc="This field is required"])[1]

### First Name Validation Tests ###scontainer
Check First Name empty
    Swipe    905    740    903    213
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    ${EMPTY}
    Click on Element mobile    //android.view.View[@content-desc=" First Name"]
    Click on Element mobile    ${elm_btn_Submit_Technician_Android}
    Check validation error message Android    xpath=(//android.view.View[@content-desc="This field is required"])[1]    ${Expected_error_required}

Check First Name min length
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    a
    Check validation error message Android    xpath=//android.view.View[@content-desc="This field must be 2 characters or longer!"]    This field must be 2 characters or longer!

# Check First Name max length
#     Click And Clear Field      //android.widget.EditText[@text="a"]
#     Click on Element mobile    ${elm_input_FirstName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    ${Long_FirstName_Tech}
# Check validation error message Android    ${elm_error_FirstName_Tech_Android}    ${Expected_error_maxLength}

# ### Email Validation Tests ###
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






# ### Last Name Validation Tests ###
# Check Last Name empty
#     Clear Text mobile          ${elm_input_LastName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    ${EMPTY}
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_LastName_Tech_Android}    ${Expected_error_required}

# Check Last Name min length
#     Clear Text mobile          ${elm_input_LastName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    b
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_LastName_Tech_Android}    ${Expected_error_minLength}

# Check Last Name max length
#     Clear Text mobile          ${elm_input_LastName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    ${Long_LastName_Tech}
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_LastName_Tech_Android}    ${Expected_error_maxLength}



# ### Phone Validation Tests ###
# Check Phone empty
#     Clear Text mobile          ${elm_input_Phone_Tech_Android}
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_Phone_Tech_Android}    ${Expected_error_required}

# Check Phone invalid
#     Clear Text mobile          ${elm_input_Phone_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Phone_Tech_Android}    123
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_Phone_Tech_Android}    ${Expected_phone_invalid}

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

# ### Password Validation Tests ###
# Check Password mismatch
#     Clear Text mobile          ${elm_input_Password_Tech_Android}
#     Clear Text mobile          ${elm_input_RePassword_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Password_Tech_Android}    Password1!
#     Fill Text Input mobile     ${elm_input_RePassword_Tech_Android}  Password2!
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_error_RePassword_Tech_Android}    ${Expected_password_mismatch}

# ### Check Email Already Exists ###
# Check email address exist
#     Clear Text mobile          ${elm_input_Email_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Email_Tech_Android}    existing@yopmail.com
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_email_exist_Tech_Android}    ${Expected_email_exist_Tech_Android}

# ### Valid Technician Creation ###
# Check Valid Technician Creation
#     Clear Text mobile          ${elm_input_FirstName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    John
#     Clear Text mobile          ${elm_input_LastName_Tech_Android}
#     Fill Text Input mobile     ${elm_input_LastName_Tech_Android}     Doe
#     Clear Text mobile          ${elm_input_Email_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Email_Tech_Android}        john.doe+test@yopmail.com
#     Clear Text mobile          ${elm_input_Phone_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Phone_Tech_Android}        5551234567
#     Clear Text mobile          ${elm_input_Password_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Password_Tech_Android}     Secret123!
#     Clear Text mobile          ${elm_input_RePassword_Tech_Android}
#     Fill Text Input mobile     ${elm_input_RePassword_Tech_Android}   Secret123!
#     Click on Element mobile    ${elm_select_Gender_Tech_Android}
#     Click on Element mobile    ${elm_option_Gender_Male_Android}
#     Clear Text mobile          ${elm_input_Address_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Address_Tech_Android}      123 Main St
#     Clear Text mobile          ${elm_input_City_Tech_Android}
#     Fill Text Input mobile     ${elm_input_City_Tech_Android}         City
#     Clear Text mobile          ${elm_input_State_Tech_Android}
#     Fill Text Input mobile     ${elm_input_State_Tech_Android}        State
#     Clear Text mobile          ${elm_input_Zipcode_Tech_Android}
#     Fill Text Input mobile     ${elm_input_Zipcode_Tech_Android}      12345
#     Click on Element mobile    ${btn_Submit_Technician_Android}
#     Check validation error message Android    ${elm_success_CreateTechnician_Android}    ${Expected_success}


*** Keywords ***
Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}" and @clickable="true"]
    END
    