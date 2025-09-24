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


*** Test Cases ***
Navigate to Create Technician Page
    [Tags]    technician    navigation
    Given User is on Home screen
    When Click on Element mobile    ${btn_OpenCreateTechnician}
    And Generate Random Data Technician
    Then System should display Create Technician screen

Validate Upload File From Gallery
    [Tags]    technician    upload
    Given User is on Create Technician screen
    When User uploads file from gallery
    Then System should display file uploaded successfully

Validate Income Rate - Salary
    [Tags]    technician    income    salary
    Given User is on Create Technician screen
    When User selects income rate type "${Type_Salary}"
    Then Income rate should be accepted

# Check Invalid Technician Color Label 
#     # Execute Script    mobile: tap    x=817    y=273
#     # Click And Clear Field    //android.widget.EditText[@text="#ffffff"]
#     # Fill Text Input mobile    //android.widget.EditText[@text="#"]    ${color}
#     # Check validation error message Android    //android.view.View[@content-desc="Invalid color value"]    Invalid color value

# Check Technician Color Label
#     Click And Clear Field    //android.widget.EditText[@text="#ffffff"]
#     Fill Text Input mobile    //android.widget.EditText[@text="#"]    ${color}
#     AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="Invalid color value"]

Validate Favor Empty
    [Tags]    technician    favor    validation
    Given User is on Create Technician screen
    When User clears favor input
    Then System should display favor required error

Validate Favor Valid
    [Tags]    technician    favor    positive
    Given User is on Create Technician screen
    When User enters favor amount by keypad    @{favor}
    Then Favor input should be accepted

### First Name Validation Tests ###
Validate First Name Empty
    [Tags]    technician    first_name    validation
    Given User is on Create Technician screen
    When Swipe    905    740    903    213
    When User enters first name "${EMPTY}"
    And User submits the create technician form
    Then System should display first name required error

Validate First Name Min Length
    [Tags]    technician    first_name    validation
    Given User is on Create Technician screen
    When User enters first name "a"
    Then System should display first name min length error

Validate First Name Valid
    [Tags]    technician    first_name    positive
    Given User is on Create Technician screen
    When Click And Clear Field      a
    And User enters first name "${firstName}"
    Then First name should be accepted

### Email Validation Tests ###
Validate Email Empty
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When User enters email "${EMPTY}"
    Then System should display empty email error message

Validate email missing @
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When User enters email "userexample.com"
    Then System should display empty email error message

Validate email missing local part
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      userexample.com
    And User enters email "@example.com"
    Then System should display empty email error message

Validate email missing domain    
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      @example.com
    And User enters email "user@"
    Then System should display empty email error message

Validate email contains spaces
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user@
    And User enters email "user @example.com"
    Then System should display empty email error message

Validate email contains special characters
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user @example.com
    And User enters email "user!"
    Then System should display empty email error message

Validate email multiple @
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user!
    And User enters email "user@@example.com"
    Then System should display empty email error message

Validate email multiple dots in domain
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user@@example.com
    And User enters email "user@example..com"
    Then System should display empty email error message

Validate email dot at start of domain
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user@example..com
    And User enters email "user@.example.com"
    Then System should display empty email error message

Validate email dot at end of domain
    [Tags]    technician    email    validation
    Given User is on Create Technician screen
    When Click And Clear Field      user@.example.com
    And User enters email "user@example."
    Then System should display empty email error message

# ### Last Name Validation Tests ###
Validate Last Name Empty
    [Tags]    technician    last_name    validation
    Given User is on Create Technician screen
    When User enters last name "${EMPTY}"
    Then System should display last name required error

Validate Last Name Min Length
    [Tags]    technician    last_name    validation
    Given User is on Create Technician screen
    When User enters last name "b"
    Then System should display last name min length error

Validate Last Name Valid
    [Tags]    technician    last_name    positive
    Given User is on Create Technician screen
    When Click And Clear Field   b
    And User enters last name "${lastName}"
    Then Last name should be accepted

# ### Password Validation Tests ###
Validate Password Empty
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When User enters password "${EMPTY}"
    Then System should display required error message

Validate Password Min Length
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When User click show eye password
    And User enters password "a"
    Then System should display Password min length error

Validate Password Missing Uppercase
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When Click And Clear Field    a
    And User enters password "password1!"
    Then System should display invalid password error message

Validate Password Missing Lowercase
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When Click And Clear Field    password1!
    And User enters password "PASSWORD1!"
    Then System should display invalid password error message

Validate Password Missing Number
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When Click And Clear Field    PASSWORD1!
    And User enters password "Password!"
    Then System should display invalid password error message

Validate Password Missing Special Character
    [Tags]    technician    password    validation
    Given User is on Create Technician screen
    When Click And Clear Field    Password!
    And User enters password "Password1"
    Then System should display invalid password error message

Validate Valid Password
    [Tags]    technician    password    positive
    Given User is on Create Technician screen
    When Click And Clear Field    Password1
    And User enters password "Password1!"
    Then Password input should be accepted

### Re-Enter Password Validation Tests ###
Validate Re-Enter Password Empty
    [Tags]    technician    re_password    validation
    Given User is on Create Technician screen
    When User click show eye re-enter password
    When User re-enter password "${EMPTY}"
    Then System should display required error message

Validate Re-Enter Password Mismatch
    [Tags]    technician    re_password    validation
    Given User is on Create Technician screen
    And User re-enter password "Password2!"
    Then System should display Re-Enter Password mismatch

Validate Valid Re-Enter Password
    [Tags]    technician    re_password    positive
    Given User is on Create Technician screen
    When Click And Clear Field    Password2!
    And User re-enter password "Password1!"
    Then Re-Enter Password input should be accepted

### Nick Name Validation Tests ###
Validate Nick Name Empty
    [Tags]    technician    nick_name    validation
    Given User is on Create Technician screen
    When User enters Nick Name "${EMPTY}"
    Then System should display required error message

Validate Nick Name Min Length
    [Tags]    technician    nick_name    validation
    Given User is on Create Technician screen
    When User enters Nick Name "a"
    Then System should display Nick name min length error

Validate Valid Nick Name
    [Tags]    technician    nick_name    positive
    Given User is on Create Technician screen
    When Click And Clear Field    a    
    When User enters Nick Name "${lastName}"
    Then Nick name should be accepted

### Phone Validation Tests ###
Validate Phone Empty
    [Tags]    technician    phone    validation
    Given User is on Create Technician screen
    When User enter phone number empty
    Then System should display required error message

Validate Phone min length
    [Tags]    technician    phone    validation
    Given User is on Create Technician screen
    When User enter min phone number
    Then System should display phone number error message

Validate InValid Phone
    [Tags]    technician    phone    validation
    Given User is on Create Technician screen
    When User enter invalid phone number
    Then System should display phone number error message

Validate Gender Selection
    [Tags]    technician    gender    positive
    Given User is on Create Technician screen
    When User select gender on combo box
    Then Gender should be accepted

## Valid Technician Creation ##
Validate Create Technician Unsuccessfully (Email/Phone Exists)
    [Tags]    technician    negative
    Given User is on Create Technician screen
    When User enters phone number "@{phoneNumber_exists}"
    And User enters email exists "school@yopmail.com"
    And User submits the create technician form
    Then System should display email/Phone exist error message

Validate Create Technician Successfully
    [Tags]    technician    positive
    Given User is on Create Technician screen
    When User enter valid information technician
    Then System should display create technician success

*** Keywords ***
User is on Home screen
    No Operation
    
System should display Create Technician screen
    No Operation

User is on Create Technician screen
    No Operation

User uploads file from gallery
    Click on Element mobile    //android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]
    Click on Element mobile    //android.view.View[@content-desc="GALLERY"]

    Click on Element mobile    //android.widget.TextView[@resource-id="android:id/title" and @text="204947806-ilustración-de-avatar-de-estudiante-retrato-de-usuario-de-dibujos-animados-simple-icono-de-perfil-de.jpg"]
    Click on Element mobile    //android.widget.Button[@content-desc="Crop"]
    Sleep    3s
System should display file uploaded successfully
    No Operation

User selects income rate type "${type}"
    Custom Income Rate Type    ${type}

Income rate should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}

User clears favor input
    Click on Element mobile    //android.view.View[@text="100.00"]    # example locator; replace if needed
    Click on Element mobile    ${btn_Clear}
    Click on Element mobile    ${btn_Done}

User submits the create technician form
    Click on Element mobile    ${btn_Submit}

User enters favor amount by keypad
    [Arguments]    @{digits}
    Click on Element mobile    xpath=//android.view.View[@text="0.00"]
    Enter NumberPad Amount    @{digits}
    Click on Element mobile    ${btn_Done}

System should display favor required error
    Check validation error message Android    //android.view.View[@content-desc="Input should not less than the minium value 1"]    Input should not less than the minium value 1

Favor input should be accepted
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="Input should not less than the minium value 1"]

User enters first name "${first_name}"
    Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    Fill Text Input mobile    ${elm_input_FirstName_Tech_Android}    ${first_name}
    Click on Element mobile    //android.view.View[@content-desc=" First Name"]

System should display first name required error
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

System should display first name min length error
    Check validation error message Android   ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

First name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

User enters email "${email}"
    Click on Element mobile    ${elm_input_Email_Tech_Android}
    Fill Text Input mobile    ${elm_input_Email_Tech_Android}    ${email}

System should display empty email error message
    Check validation error message Android   ${elm_Empty_error_Android}    ${Expected_error_required}

User enters last name "${last_name}"
    Click on Element mobile    ${elm_input_LastName_Tech_Android}
    Fill Text Input mobile    ${elm_input_LastName_Tech_Android}    ${last_name}

System should display last name required error
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

System should display last name min length error
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Last name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

User click show eye password
    Click on Element mobile    ${elm_Show_Password_Android}

User enters password "${password}"
    Click on Element mobile    ${elm_input_Password_Tech_Android}
    Fill Text Input mobile    ${elm_input_Password_Tech_Android}    ${password}

System should display required error message
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

System should display Password min length error
    Check validation error message Android    ${elm_error_minPassword_Android}    ${Expected_minLengthPassword_Android}

System should display invalid password error message
    Check validation error message Android    ${elm_error_invalidPassword_Android}    ${Expected_invalidPassword_Android}

Password input should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_error_invalidPassword_Android}

User click show eye re-enter password
    Click on Element mobile    ${elm_Show_ReEnterPassword_Android}
    Click on Element mobile    //android.view.View[@content-desc=" Re-enter Password"]
User re-enter password "${re-enter_password}"
    Click on Element mobile    ${elm_input_RePassword_Tech_Android}
    Fill Text Input mobile    ${elm_input_RePassword_Tech_Android}    ${re-enter_password}

System should display Re-Enter Password mismatch
    Check validation error message Android    ${elm_error_missMatch_Password}    ${Expected_password_mismatch}

Re-Enter Password input should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_error_missMatch_Password}

User enters Nick Name "${nick_name}"
    Click on Element mobile    ${elm_input_NickName_Tech_Android}
    Fill Text Input mobile    ${elm_input_NickName_Tech_Android}    ${nick_name}

System should display Nick name min length error
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Nick name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

User enter phone number empty
    Click on Element mobile         //android.view.View[@content-desc=" Phone Number"]
    Click on Element mobile         ${elm_input_Phone_Tech_Android}
    Click on Element mobile         ${btn_Done}

User enter min phone number
    Click on Element mobile         ${elm_input_Phone_Tech_Android}
    Enter NumberPad Amount          1    2    3
    Click on Element mobile         ${btn_Done}

User enter invalid phone number
    Click on Element mobile         //android.view.View[@text="(123"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          1    2    3    4    5    6    7    8    9    0
    Click on Element mobile         ${btn_Done}

System should display phone number error message
    Check validation error message Android    ${elm_error_invalidPhone}    ${Expected_phone_invalid}

User select gender on combo box
    Click on Element mobile         //android.view.View[@content-desc="Gender"]
    Click on Element mobile         //android.view.View[@content-desc="Male"]
    Click on Element mobile         ${btn_Submit}

Gender should be accepted
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="This field is required"]

User enters phone number "@{phoneNumber_exists}"
    Click on Element mobile         //android.view.View[@text="(123) 456-7890"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          @{phoneNumber_exists}
    Click on Element mobile         ${btn_Done}

User enters email exists "${email}"
    Click And Clear Field        user@example.
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    ${email}
    Click on Element mobile    ${elm_Title_Email_Tech_Android}
    Click on Element mobile         ${btn_Submit}

System should display email/Phone exist error message
    Check validation error message Android    ${elm_email_exist_Tech_Android}    ${Expected_email_exist_Tech_Android}
    Check validation error message Android    ${elm_Phone_exist_Tech_Android}    ${Expected_Phone_exist_Tech_Android}

User enter valid information technician
    Click on Element mobile         //android.view.View[@text="(923) 456-7890"]
    Click on Element mobile         ${btn_Clear}
    Enter NumberPad Amount          @{phoneNumber}
    Click on Element mobile         ${btn_Done}

    Click And Clear Field        school@yopmail.com
    Fill Text Input mobile     ${elm_input_Email_Tech_Android}    ${Gen_email}
    Click on Element mobile    ${elm_Title_Email_Tech_Android}

    Click on Element mobile     ${elm_input_Address_Tech_Android}
    Fill Text Input mobile      ${elm_input_Address_Tech_Android}    ${Address}

    Click on Element mobile     ${elm_input_State_Tech_Android}
    Fill Text Input mobile      ${elm_input_State_Tech_Android}    ${state}
    
    Click on Element mobile     ${elm_input_City_Tech_Android}
    Fill Text Input mobile      ${elm_input_City_Tech_Android}    ${city}
    Click on Element mobile     //android.view.View[@content-desc="City"]

    Click on Element mobile     ${elm_input_Zipcode_Tech_Android}
    Enter NumberPad Amount      @{zip}
    Click on Element mobile     ${btn_Done}

    Click on Element mobile     ${elm_input_Dob_Tech_Android}
    Swipe Dob Technician        July    17    2022
    

#     Click on Element mobile         ${btn_Submit}

System should display create technician success
    Check validation error message Android    ${elm_Create_Technician_Success_Android}    ${Expected_Create_Technician_Success_Android}

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
        Click on Element mobile     ${btn_Done}
        AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}
    ELSE IF    ${Incomes_type} == 'services'
        Click on Element mobile     //android.view.View[@content-desc="Salary"]
        Click on Element mobile    //android.view.View[@content-desc="Service"]
        Click on Element mobile     ${btn_Submit}
        Click on Element mobile    //android.view.View[@content-desc="60%"]
        Click on Element mobile    //android.view.View[@content-desc="Other"]
        Click on Element mobile     //android.view.View[@content-desc="Submit"]
        Click on Element mobile    ${elm_input_IncomeRate_Tech_Android}
        Enter NumberPad Amount      @{income_rate_services}
        Click on Element mobile     ${btn_Done}
    ELSE    
        Log     Fail
    END    

Generate Random Data Technician
    # Generate First Name and Last Name
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
    ${cvt_Zip}=   Convert To List    ${Gen_zip}
    Set Suite Variable    ${zip}    ${cvt_Zip}

    #Generate Color
    ${Gen_color}=    FakerLibrary.Hex Color
    
    ${split_color}=        Set Variable    ${Gen_color[1:]}
    
    Set Suite Variable    ${color}    ${split_color}

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

    AppiumLibrary.Click Element    ${btn_Select}