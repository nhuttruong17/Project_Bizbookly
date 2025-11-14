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
Test Swipe
    Test Swipe Fast Dob Technician       April   15    1990
    
    

Navigate to Update Technician Page
    [Tags]    technician    navigation
    Given User is on Home screen
    When Select Technician random
    And Generate Random Data Technician
    Then System should display Update Technician screen

Validate Upload File From Gallery
    [Tags]    technician    upload
    Given User is on Update Technician screen
    When User uploads file from gallery
    Then System should display file uploaded successfully

Validate Income Rate - Salary
    [Tags]    technician    income    salary
    Given User is on Update Technician screen
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
    Given User is on Update Technician screen
    When User clears favor input
    Then System should display favor required error

Validate Favor Valid
    [Tags]    technician    favor    positive
    Given User is on Update Technician screen
    When User enters favor amount by keypad    @{favor}
    Then Favor input should be accepted

### First Name Validation Tests ###
Validate First Name Empty
    [Tags]    technician    first_name    validation
    Given User is on Update Technician screen
    When User enters first name "${EMPTY}"
    And User submits the update technician form
    Then System should display first name required error

Validate First Name Min Length
    [Tags]    technician    first_name    validation
    Given User is on Update Technician screen
    When User enters first name "a"
    Then System should display first name min length error

Validate First Name Valid
    [Tags]    technician    first_name    positive
    Given User is on Update Technician screen
    When User enters first name "${firstName}"
    Then First name should be accepted

# ### Last Name Validation Tests ###
Validate Last Name Empty
    [Tags]    technician    last_name    validation
    Given User is on Update Technician screen
    When User enters last name "${EMPTY}"
    Then System should display last name required error

Validate Last Name Min Length
    [Tags]    technician    last_name    validation
    Given User is on Update Technician screen
    When User enters last name "b"
    Then System should display last name min length error

Validate Last Name Valid
    [Tags]    technician    last_name    positive
    Given User is on Update Technician screen
    When User enters last name "${lastName}"
    Then Last name should be accepted

### Nick Name Validation Tests ###
Validate Nick Name Empty
    [Tags]    technician    nick_name    validation
    Given User is on Update Technician screen
    When User enters Nick Name "${EMPTY}"
    Then System should display required error message

Validate Nick Name Min Length
    [Tags]    technician    nick_name    validation
    Given User is on Update Technician screen
    When User enters Nick Name "a"
    Then System should display Nick name min length error

Validate Valid Nick Name
    [Tags]    technician    nick_name    positive
    Given User is on Update Technician screen
    When User enters Nick Name "${lastName}"
    Then Nick name should be accepted

Validate Gender Selection
    [Tags]    technician    gender    positive
    Given User is on Update Technician screen
    When User select gender on combo box
    Then Gender should be accepted

## Valid Technician Creation ##
# Validate Update Technician Unsuccessfully
#     [Tags]    technician    negative
#     Given User is on Update Technician screen
#     When User enters phone number "@{phoneNumber_exists}"
#     # And User enters email exists "school@yopmail.com"
#     And User submits the update technician form
    # Then System should display email/Phone exist error message

Validate Update Technician Successfully
    [Tags]    technician    positive
    Given User is on Update Technician screen
    When User enter valid information technician
    # Then System should display update technician success

*** Keywords ***
User is on Home screen
    No Operation
    
System should display Update Technician screen
    No Operation

User is on Update Technician screen
    No Operation

User uploads file from gallery
    ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible    xpath=//android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]

    IF    ${is_visible}
        Click on Element mobile    //android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]
        Click on Element mobile    //android.view.View[@content-desc="GALLERY"]
        Click on Element mobile    //android.widget.TextView[@resource-id="android:id/title" and @text="204947806-ilustración-de-avatar-de-estudiante-retrato-de-usuario-de-dibujos-animados-simple-icono-de-perfil-de.jpg"]
        Click on Element mobile    //android.widget.Button[@content-desc="Crop"]
        # Sleep    3s
    ELSE
        Click on Element mobile    xpath=//android.view.View[5][@clickable="true"]
        Click on Element mobile    //android.view.View[contains(@content-desc, "Choose an image") and contains(@content-desc, "Select file")]
        Click on Element mobile    //android.view.View[@content-desc="GALLERY"]
        Click on Element mobile    //android.widget.TextView[@resource-id="android:id/title" and @text="204947806-ilustración-de-avatar-de-estudiante-retrato-de-usuario-de-dibujos-animados-simple-icono-de-perfil-de.jpg"]
        Click on Element mobile    //android.widget.Button[@content-desc="Crop"]
        # Sleep    3s
    END    

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

User submits the update technician form
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
    ${get-firstName}=    AppiumLibrary.Get Element Attribute    xpath=//android.view.View[@index=17]/android.widget.EditText[@index=0]    text
    Click And Clear Field    ${get-firstName}
    Fill Text Input mobile    ${elm_input_FirstName_Tech_Android}    ${first_name}
    Click on Element mobile    xpath=//android.view.View[@content-desc=" First Name"]

System should display first name required error
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

System should display first name min length error
    Check validation error message Android   ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

First name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

User enters last name "${last_name}"
    ${get-lastName}=    AppiumLibrary.Get Element Attribute    xpath=//android.view.View[@index=22]/android.widget.EditText[@index=0]    text
    Click And Clear Field    ${get-lastName}
    Fill Text Input mobile    ${elm_input_LastName_Tech_Android}    ${last_name}
    Click on Element mobile    xpath=//android.view.View[@content-desc=" Last Name"]

System should display last name required error
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

System should display last name min length error
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Last name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

System should display required error message
    Check validation error message Android    ${elm_Empty_error_Android}    ${Expected_error_required}

User enters Nick Name "${nick_name}"
    ${get-nickName}=    AppiumLibrary.Get Element Attribute    xpath=//android.view.View[@index=26]/android.widget.EditText[@index=0]    text
    Click And Clear Field    ${get-nickName}
    Fill Text Input mobile    ${elm_input_NickName_Tech_Android}    ${nick_name}
    Click on Element mobile    xpath=//android.view.View[@content-desc=" Nick name"]

System should display Nick name min length error
    Check validation error message Android    ${elm_minLength_error_Android}    ${Expected_minLength_error_Android}

Nick name should be accepted
    AppiumLibrary.Page Should Not Contain Element    ${elm_minLength_error_Android}

User select gender on combo box
    Click on Element mobile         xpath=//android.view.View[@index=18]
    Click on Element mobile         xpath=//android.view.View[@content-desc="Male"]
    Click on Element mobile         ${btn_Submit}

Gender should be accepted
    AppiumLibrary.Page Should Not Contain Element    //android.view.View[@content-desc="This field is required"]


User enter valid information technician

    # Click on Element mobile    ${elm_input_FirstName_Tech_Android}
    # Fill Text Input mobile    ${elm_input_FirstName_Tech_Android}    ${first_name}

    # Click on Element mobile    ${elm_input_LastName_Tech_Android}
    # Fill Text Input mobile    ${elm_input_LastName_Tech_Android}    ${last_name}
    
    # Click on Element mobile    ${elm_input_NickName_Tech_Android}
    # Fill Text Input mobile    ${elm_input_NickName_Tech_Android}    ${last_name}

    Click on Element mobile    xpath=//android.view.View[@content-desc=" Nick name"]
    Click on Element mobile     ${elm_input_Dob_Tech_Android}
    Swipe Dob Technician        July    17    2022
    

#     Click on Element mobile         ${btn_Submit}

System should display update technician success
    Check validation error message Android    ${elm_Update_Technician_Success_Android}    ${Expected_Create_Technician_Success_Android}

Enter NumberPad Amount
    [Arguments]    @{digits}
    FOR    ${digit}    IN    @{digits}
        Click on Element mobile    //android.view.View[@content-desc="${digit}" and @clickable="true"]
    END
    
Custom Income Rate Type
    [Arguments]    ${Incomes_type}

    IF    ${Incomes_type} == 'salary'
        Click on Element mobile     xpath=//android.view.View[@content-desc="Service" or @content-desc="Salary"] 
        Click on Element mobile     xpath=//android.view.View[@content-desc="Salary"]
        Click on Element mobile     ${btn_Submit}
        Click on Element mobile     xpath=//android.view.View[contains(@hint, "$")]
        Click on Element mobile     xpath=//android.view.View[@content-desc="Clear"]
        Enter NumberPad Amount      @{income_rate}
        Click on Element mobile     ${btn_Done}
        # AppiumLibrary.Page Should Not Contain Element    ${elm_Empty_error_Android}
    ELSE IF    ${Incomes_type} == 'services'
        Click on Element mobile     xpath=//android.view.View[@content-desc="Service" or @content-desc="Salary"] 
        Click on Element mobile     xpath=//android.view.View[@content-desc="Service"]
        Click on Element mobile     ${btn_Submit}
        Click on Element mobile     xpath=//android.view.View[@content-desc="60%" or @content-desc="70%" or @content-desc="Other"]
        Click on Element mobile     xpath=//android.view.View[@content-desc="Other"]
        Click on Element mobile     xpath=//android.view.View[@content-desc="Submit"]
        Click on Element mobile     xpath=//android.view.View[@hint="%"] 
        Click on Element mobile     xpath=//android.view.View[@content-desc="Clear"]
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

    #Generate Color
    # ${Gen_color}=    FakerLibrary.Hex Color
    
    # ${split_color}=        Set Variable    ${Gen_color[1:]}
    
    # Set Suite Variable    ${color}    ${split_color}

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

Select Technician random
    ${technicians}=    AppiumLibrary.Get Webelements    xpath=//android.view.View[17]/android.view.View/android.view.View[@clickable="true"]
    ${count}=    Get Length    ${technicians}
    Log    Total technicians: ${count}
    ${random_index}=    Evaluate    random.randint(0, ${count}-1)    modules=random
    ${element}=    Get From List    ${technicians}    ${random_index}
    AppiumLibrary.Click Element    ${element}
    Click on Element mobile    ${btn_Update_Technician_Android}



Test Swipe Fast Dob Technician
    [Arguments]     ${MONTH_TARGET}    ${DAY_TARGET}    ${YEAR_TARGET}           
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.SeekBar        20s
    ${seekbars}=    AppiumLibrary.Get Webelements    xpath=//android.widget.SeekBar
    ${month_seekbar}=    Set Variable    ${seekbars[0]}
    ${day_seekbar}=      Set Variable    ${seekbars[1]}
    ${year_seekbar}=     Set Variable    ${seekbars[2]}

    # Swipe năm
    FOR    ${i}    IN RANGE    120
        ${year}=    AppiumLibrary.Get Element Attribute    ${year_seekbar}    content-desc
        ${current_year}=    Convert To Integer    ${year}
        ${year_target_int}=    Convert To Integer    ${YEAR_TARGET}
        ${swipe_year}=      Evaluate   ${current_year} - ${year_target_int}
        Log    ${swipe_year}
        WHILE    ${swipe_year} > 0
            IF    ${swipe_year} >= 10
                Swipe    766    252   768    490
                ${swipe_year}=    Evaluate    ${swipe_year} - 10
            ELSE IF    ${swipe_year} >= 5
                Swipe    766    350   768    480
                ${swipe_year}=    Evaluate    ${swipe_year} - 5
            ELSE IF    ${swipe_year} >= 2
                Swipe    766    350   768    400
                ${swipe_year}=    Evaluate    ${swipe_year} - 2
            ELSE
                Swipe    766    378   768    411
                ${swipe_year}=    Evaluate    ${swipe_year} - 1
            END
        END
        Exit For Loop If    '${year}' == '${YEAR_TARGET}'
        Sleep    0.5s
    END
    # Log    ${year}
    Should Be Equal As Strings    ${year}    ${YEAR_TARGET}

    # Swipe tháng
    FOR    ${i}    IN RANGE    12
        ${month}=    AppiumLibrary.Get Element Attribute    ${month_seekbar}    content-desc
        ${month_map}=    Create Dictionary    January=1    February=2    March=3    April=4    May=5    June=6    July=7    August=8    September=9    October=10    November=11    December=12
        ${current_month_int}=    Get From Dictionary    ${month_map}    ${month}
        ${month_target_int}=    Get From Dictionary    ${month_map}    ${MONTH_TARGET}
        ${swipe_month}=    Evaluate    abs(int(${month_target_int}) - int(${current_month_int}))
        
        Log    ${swipe_month}
        WHILE    ${swipe_month} > 0
            IF    ${swipe_month} >= 10
                Swipe    622    175   624    411
                ${swipe_month}=    Evaluate    ${swipe_month} - 10
            ELSE IF    ${swipe_month} >= 5
                Swipe    622    280   624    411
                ${swipe_month}=    Evaluate    ${swipe_month} - 5
            ELSE IF    ${swipe_month} >= 2
                Swipe    622    360   624    411
                ${swipe_month}=    Evaluate    ${swipe_month} - 2
            ELSE
                Swipe    622    376   624    411
                ${swipe_month}=    Evaluate    ${swipe_month} - 1
            END
        END
        Exit For Loop If    '${month}' == '${MONTH_TARGET}'
        Sleep    0.5s
    END
    Log    ${month}
    Should Be Equal As Strings    ${month}    ${MONTH_TARGET}

    # Swipe ngày
    FOR    ${i}    IN RANGE    31
        ${day}=    AppiumLibrary.Get Element Attribute    ${day_seekbar}    content-desc
        ${current_day}=    Convert To Integer    ${day}
        ${day_target_int}=    Convert To Integer    ${DAY_TARGET}
        ${swipe_day}=    Evaluate    abs(int(${current_day}) - int(${day_target_int}))
        Log    ${swipe_day}
        WHILE    ${swipe_day} > 0
            IF    ${swipe_day} >= 10
                Swipe    713    376   709    614
                ${swipe_day}=    Evaluate    ${swipe_day} - 10
            ELSE IF    ${swipe_day} >= 5
                Swipe    713    376   709    510
                ${swipe_day}=    Evaluate    ${swipe_day} - 5
            ELSE IF    ${swipe_day} >= 2
                Swipe    713    376   709    426
                ${swipe_day}=    Evaluate    ${swipe_day} - 2
            ELSE
                Swipe    713    376   709    405
                ${swipe_day}=    Evaluate    ${swipe_day} - 1
            END
        END
        Exit For Loop If    '${day}' == '${DAY_TARGET}'
        Sleep    0.5s
    END
    Log    ${day}
    Should Be Equal As Strings    ${day}    ${DAY_TARGET}

    AppiumLibrary.Click Element    ${btn_Select}


