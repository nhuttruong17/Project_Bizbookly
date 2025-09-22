*** Settings ***
Resource        ../../../TestKeyWords/Common.robot
Resource        ../../../Resources/Locators/TechnicianLocators.robot
Suite Setup     Basic Setup Android
Suite Teardown  Basic TearDowns Android
Library    String
Library    OperatingSystem
Library    json
Library    Collections
Library    FakerLibrary

*** Variables ***

${Expected_error_minLength}    Minimum length is 2
${Expected_error_maxLength}    Maximum length exceeded
${Expected_email_invalid}      Email invalid
${elm_error_invalidPhone}      xpath=//android.view.View[@content-desc="Invalid format Phone Number"]
${Expected_phone_invalid}      Invalid format Phone Number

${Expected_success}                       Technician created successfully
${elm_btn_Submit_Technician_Android}      xpath=//android.view.View[@content-desc="Submit"]
${elm_btn_Done_Android}                   xpath=//android.view.View[@content-desc="Done"]
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
*** Test Cases ***
Generate Random Data
    ${first}=    FakerLibrary.First Name Male
    ${last}=     FakerLibrary.Last Name Male
    Set Suite Variable    ${lastName}    ${last}
    Set Suite Variable    ${firstName}   ${first}

    #Generarte income rate 3k$-300k$ - Salary
    ${Gen_income_rate}=    Evaluate    random.randint(300000, 3000000)    random
    ${convertStr_income_rate}=    Convert To String    ${Gen_income_rate}
    ${convertList_income_rate}=    Convert To List    ${convertStr_income_rate}
    Set Suite Variable    ${income_rate}    ${convertList_income_rate}

    #Generarte income rate 1-100% - Services
    ${Gen_income_rate_services}=    Evaluate    random.randint(1, 100)    random
    ${convertStr_income_rate_services}=    Convert To String    ${Gen_income_rate_services}
    ${convertList_income_rate_services}=    Convert To List    ${convertStr_income_rate_services}
    Set Suite Variable    ${income_rate_services}    ${convertList_income_rate_services}

    #Generarte favor 1$-100$
    ${Gen_favor}=    Evaluate    random.randint(100, 10000)    random
    ${convertStr_favor}=    Convert To String    ${Gen_favor}
    ${convertList_favor}=    Convert To List    ${convertStr_favor}
    Set Suite Variable    ${favor}    ${convertList_favor}

    # Generate Phone Number
    ${rest}=    Evaluate    ''.join([str(random.randint(0,9)) for _ in range(9)])    random
    ${num}=     Catenate    SEPARATOR=    9    ${rest}
    ${convert_num}=    Convert To List    ${num}
    Set Suite Variable    ${phoneNumber}    ${convert_num}

    # Generate Random Email
    ${lower}=   Convert To Lower Case    ${lastName}
    ${rand}=    Generate Random String    4    [NUMBERS]
    ${email}=   Catenate    SEPARATOR=    ${lower}${rand}    @yopmail.com
    Set Suite Variable    ${Gen_email}    ${email}    
    
    # Generate Long Address
    ${Long_Address_Tech}=    FakerLibrary.Address
    Set Suite Variable    ${Address}    ${Long_Address_Tech}

    #Generate State
    ${Gen_state}=    FakerLibrary.State
    Set Suite Variable    ${state}    ${Gen_state}

    #Generate City
    ${Gen_city}=    FakerLibrary.City
    Set Suite Variable    ${city}    ${Gen_city}

    #Generate Zip Code
    ${Gen_zip}=    FakerLibrary.Zip Code
    Set Suite Variable    ${zip}    ${Gen_zip}

    #Generate Color
    ${Gen_color}=    FakerLibrary.Hex Color
    
    ${split_color}=        Set Variable    ${Gen_color[1:]}
    
    Set Suite Variable    ${color}    ${split_color}




Navigate to Create Technician Page
    Click on Element mobile    ${btn_OpenCreateTechnician}

User uploads file from gallery
    Click on Element mobile    //android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]
    Click on Element mobile    //android.view.View[@content-desc="GALLERY"]

    Click on Element mobile    //android.widget.TextView[@resource-id="android:id/title" and @text="204947806-ilustración-de-avatar-de-estudiante-retrato-de-usuario-de-dibujos-animados-simple-icono-de-perfil-de.jpg"]
    Click on Element mobile    //android.widget.Button[@content-desc="Crop"]
    Sleep    3s

### Income Rate Validation Tests ###
Check Imcome Rate
    Custom Income Rate Type    'salary'
    AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}

# Check Invalid Technician Color Label 
    
#     # Execute Script    mobile: tap    x=817    y=273
#     # Click And Clear Field    //android.widget.EditText[@text="#ffffff"]
#     # Fill Text Input mobile    //android.widget.EditText[@text="#"]    ${color}
#     # Check validation error message Android    //android.view.View[@content-desc="Invalid color value"]    Invalid color value

# Check Technician Color Label
    
#     Click And Clear Field    //android.widget.EditText[@text="#ffffff"]
#     Fill Text Input mobile    //android.widget.EditText[@text="#"]    ${color}
#     AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="Invalid color value"]

Check Favor empty
    Click on Element mobile        //android.view.View[@text="100.00"]
    Click on Element mobile    xpath=//android.view.View[@content-desc="Clear"]
    Click on Element mobile        xpath=//android.view.View[@content-desc="Done"]
    Check validation error message Android    //android.view.View[@content-desc="Input should not less than the minium value 1"]    Input should not less than the minium value 1    

Check valid Favor
    Click on Element mobile        xpath=//android.view.View[@text="0.00"]
    Enter NumberPad Amount         @{favor}
    Click on Element mobile        ${elm_btn_Done_Android}
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="Input should not less than the minium value 1"]

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
    Fill Text Input mobile     ${elm_input_FirstName_Tech_Android}    ${firstName}
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
    Fill Text Input mobile     ${elm_input_LastName_Tech_Android}    ${lastName}
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
    Fill Text Input mobile          ${elm_input_NickName_Tech_Android}    ${lastName}
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

Check Gender
    Click on Element mobile         //android.view.View[@content-desc="Gender"]
    Click on Element mobile         //android.view.View[@content-desc="Male"]
    Click on Element mobile         ${btn_Submit}
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="This field is required"]

Check Create Technician Unsuccessfully (Without Email exist and Phone Exists)
    Click on Element mobile         //android.view.View[@text="(123) 456-7890"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          9    2    3    4    5    6    7    8    9    0
    Click on Element mobile         ${btn_Done}

    Click And Clear Field        user@example.
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    school@yopmail.com
    Click on Element mobile    //android.view.View[@content-desc=" Email"]
    Click on Element mobile         ${btn_Submit}

    Check validation error message Android    ${elm_email_exist_Tech_Android}    ${Expected_email_exist_Tech_Android}
    Check validation error message Android    ${elm_Phone_exist_Tech_Android}    ${Expected_Phone_exist_Tech_Android}

## Valid Technician Creation ##
Check Valid Technician Creation successfully
    Click on Element mobile         //android.view.View[@text="(923) 456-7890"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          @{phoneNumber}
    Click on Element mobile         ${btn_Done}

    Click And Clear Field        school@yopmail.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    ${Gen_email}
    Click on Element mobile    //android.view.View[@content-desc=" Email"]

    Click on Element mobile     //android.view.View[@hint="Address"]
    Fill Text Input mobile    //android.view.View[@hint="Address"]    ${Address}

    Click on Element mobile     //android.view.View[@hint="State"]
    Fill Text Input mobile    //android.view.View[@hint="State"]    ${state}
    
    Click on Element mobile     //android.view.View[@hint="City"]
    Fill Text Input mobile    //android.view.View[@hint="City"]    ${city}

    Click on Element mobile     //android.view.View[@hint="Zipcode"]
    Fill Text Input mobile    //android.view.View[@hint="Zipcode"]    ${zip}

    Click on Element mobile     //android.view.View[@hint="Date of Birth"]
    Swipe Dob Android Index    July    17    2022
    

    

#     Click on Element mobile         ${btn_Submit}
#     Check validation error message Android    //android.view.View[@content-desc="Technician Successfully Created"]    Technician Successfully Created
    



*** Keywords ***
Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}" and @clickable="true"]
    END
    
Custom Income Rate Type
    [Arguments]    ${Incomes_type}='services'

    IF    ${Incomes_type} == 'salary'
        Click on Element mobile     ${elm_input_IncomeRate_Tech_Android}
        Enter NumberPad Amount      @{income_rate}
        Click on Element mobile     ${elm_btn_Done_Android}
        AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}
    ELSE IF    ${Incomes_type} == 'services'
        Click on Element mobile     //android.view.View[@content-desc="Salary"]
        Click on Element mobile    //android.view.View[@content-desc="Service"]
        Click on Element mobile     //android.view.View[@content-desc="Submit"]
        Click on Element mobile    //android.view.View[@content-desc="60%"]
        Click on Element mobile    //android.view.View[@content-desc="Other"]
        Click on Element mobile     //android.view.View[@content-desc="Submit"]
        Click on Element mobile    //android.view.View[contains(@hint, "Income Rate")]
        Enter NumberPad Amount      @{income_rate_services}
        Click on Element mobile     ${elm_btn_Done_Android}
    ELSE    
        Log     Fail
    END    

Swipe Dob Technician
    [Arguments]    ${MONTH_TARGET}    ${DAY_TARGET}    ${YEAR_TARGET}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.SeekBar        10s
    ${seekbars}=    AppiumLibrary.Get Webelements    //android.widget.SeekBar
    ${month_seekbar}=    Set Variable    ${seekbars[0]}
    ${day_seekbar}=      Set Variable    ${seekbars[1]}
    ${year_seekbar}=     Set Variable    ${seekbars[2]}

    # Swipe năm
    FOR    ${i}    IN RANGE    120
        ${year}=    AppiumLibrary.Get Element Attribute    ${year_seekbar}    content-desc
        Exit For Loop If    '${year}' == '${YEAR_TARGET}'
        Swipe    766    378   768    411
        Sleep    0.5s
    END
    Log    ${year}
    Should Be Equal As Strings    ${year}    ${YEAR_TARGET}

    # Swipe tháng
    FOR    ${i}    IN RANGE    12
        ${month}=    AppiumLibrary.Get Element Attribute    ${month_seekbar}    content-desc
        Exit For Loop If    '${month}' == '${MONTH_TARGET}'
        Swipe    622    376   624    411
        Sleep    0.5s
    END
    Log    ${month}
    Should Be Equal As Strings    ${month}    ${MONTH_TARGET}

    # Swipe ngày
    FOR    ${i}    IN RANGE    31
        ${day}=    AppiumLibrary.Get Element Attribute    ${day_seekbar}    content-desc
        Exit For Loop If    '${day}' == '${DAY_TARGET}'
        Swipe    707    376   709    405
        Sleep    0.5s
    END
    Log    ${day}
    Should Be Equal As Strings    ${day}    ${DAY_TARGET}

    AppiumLibrary.Click Element    //android.view.View[@content-desc="Select"]