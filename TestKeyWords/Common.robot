*** Settings ***
Library     SeleniumLibrary
Library     AppiumLibrary
Resource    ../TestData/Browser/Global.robot
Library     ../LibPy/FinalNetwork.py        WITH NAME    Network
*** Keywords ***
Basic Setup
#new#
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${logging_prefs}=    Create Dictionary    performance=ALL
    Call Method    ${options}    set_capability    goog:logging
    ...    Prefs    ${logging_prefs}
#    Call Method    ${options}    add_argument     --headless
#    Call Method    ${options}    add_argument    --start-maximized
#    Call Method    ${options}    add_argument    --incognito
#    Call Method    ${options}    add_argument    --disable-popup-blocking
#    RETURN    ${options}
    Open Browser    ${BASE_URL}    ${CHROME_BROWSER}    options=${options}
#    Maximize Browser Window
#    Set Window Size    1920    1080 
#new#

Basic TearDowns
    Sleep    3
    Close Browser

#API  Request#
API Request
    [Arguments]     ${Method}    ${API_URL}    ${Payload}    ${Expected_Status_Code}
    ${response}=    Run Keyword   ${Method}    url=${API_URL}   json=${Payload}       expected_status=${Expected_Status_Code}
    RETURN  ${response}

API Request With Params
    [Arguments]     ${Method}   ${API_URL}    ${params}    ${Expected_Status_Code}
    ${response}=    Run Keyword   ${Method}  url=${API_URL}    params=${params}    expected_status=${Expected_Status_Code}
    RETURN          ${response}
#API  Request#
##Fill Text Input ##
Fill Text Input
    [Arguments]    ${elm_input}    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${elm_input}    10s
    SeleniumLibrary.Input Text    ${elm_input}    ${text}
##Click on element##
Click on Element
    [Arguments]    ${elm_input}
    SeleniumLibrary.Wait Until Element Is Visible    ${elm_input}    10s
    SeleniumLibrary.Click Element    ${elm_input}

##Check Validation Text ##
Check validation error message
    [Arguments]    ${Elm_message}      ${Expected_message}
    SeleniumLibrary.Wait Until Element Is Visible    ${Elm_message}      15s
    ${error_message_invalid} =    SeleniumLibrary.Get Text    ${Elm_message}
    Should Be Equal As Strings    ${error_message_invalid}     ${Expected_message}    Validation text successfully -> Expected: '${Expected_message}', Observed: '${error_message_invalid}'
    Set Test Message    validation error message with '${error_message_invalid}'
##Check Validation Text ##
Generate Secure Password
    ${uppercase}=    Evaluate    random.choice(string.ascii_uppercase)    modules=random,string
    ${lowercase}=    Evaluate    random.choice(string.ascii_lowercase)    modules=random,string
    ${digit}=        Evaluate    random.choice(string.digits)             modules=random,string
    ${special}=      Evaluate    random.choice("!@#$%^&*")              modules=random
    ${remaining}=    Evaluate    ''.join(random.choices(string.ascii_letters + string.digits + "!@#$%^&*", k=4))    modules=random,string
    ${password}=     Set Variable    ${uppercase}${lowercase}${digit}${special}${remaining}
    ${shuffled}=     Evaluate    ''.join(random.sample(list('${password}'), len('${password}')))    modules=random
    RETURN    ${shuffled}
##Request Payload###
Prepare For Request Interception
    [Arguments]    ${endpoint}
    ${driver}=    Get Library Instance    SeleniumLibrary
    Network.Inject Request Interceptor    ${driver.driver}    ${endpoint}
    RETURN    ${driver}

Get Request API
    [Arguments]    ${driver}
    ${requests}=    Network.Get Intercepted Requests    ${driver.driver}
    ${status}=    Set Variable    ${requests[0]['status']}
    ${url}=       Set Variable    ${requests[0]['url']}
    ${payload}=   Set Variable    ${requests[0]['payload']}
    ${body}=      Set Variable    ${requests[0]['response']}
    &{result}=    Create Dictionary    status=${status}    body=${body}     payload=${payload}      url=${url}
    RETURN    ${result}

Parse Response API
    [Arguments]    ${body}
    ${response_json}=    Evaluate    json.loads('''${body}''')    json
    ${success}=          Set Variable    ${response_json['success']}
    ${statusCode}=       Set Variable    ${response_json['statusCode']}
    ${message}=          Set Variable    ${response_json['message']}
    ${data}=             Set Variable    ${response_json['data']}
    &{parsed}=           Create Dictionary    success=${success}    statusCode=${statusCode}  message=${message}    data=${data}
    RETURN    &{parsed}
##Request Payload###




##Mobile
Basic Setup iOS
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}   appium:automationName=${AUTOMATION_NAME}    appium:udid=${UDID_iPad_Huy}     appium:bundleId=${BUNDLE_ID}       noReset=true
Basic TearDowns iOS
    Sleep    3
    Close Application

Basic Setup Android
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME_Android}   appium:automationName=${AUTOMATION_NAME_Android}    appium:device=${UDID_Android}     appium:appPackage=${APP_PACKAGE}   appium:appActivity=${APP_ACTIVITY}       noReset=true      autoGrantPermissions=true
Basic TearDowns Android
    Sleep    3
    Close Application

##Fill Text Input mobile ##
Fill Text Input mobile
    [Arguments]    ${elm_input}    ${text}
    AppiumLibrary.Wait Until Element Is Visible    ${elm_input}    10s
    AppiumLibrary.Input Text    ${elm_input}    ${text}

Click on Element mobile
    [Arguments]    ${elm_input}
    AppiumLibrary.Wait Until Element Is Visible    ${elm_input}    10s
    AppiumLibrary.Click Element    ${elm_input}

Click And Clear Field
    [Arguments]    ${current_text}
    Click on Element mobile    //android.widget.EditText[@text="${current_text}"]
    Clear Text                //android.widget.EditText[@text="${current_text}"]

Check validation error message mobile
    [Arguments]    ${Elm_message}      ${Expected_message}
    AppiumLibrary.Wait Until Element Is Visible    ${Elm_message}      20s
    ${error_message_invalid} =    AppiumLibrary.Get Text    ${Elm_message}
    Should Be Equal As Strings    ${error_message_invalid}     ${Expected_message}    Validation text successfully -> Expected: '${Expected_message}', Observed: '${error_message_invalid}'
    Set Test Message   validation error message with '${error_message_invalid}'

Check validation error message Android
    [Arguments]    ${Elm_message}    ${Expected_message}
    AppiumLibrary.Wait Until Element Is Visible    ${Elm_message}    15s
    ${actual}=    AppiumLibrary.Get Element Attribute    ${Elm_message}    content-desc
    Should Be Equal As Strings    ${actual}    ${Expected_message}    Validation text successfully -> Expected: '${Expected_message}', Observed: '${actual}'
    Set Test Message   validation error message with '${actual}'
##Mobile IOS
Swipe From
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}
    # Swipe từ (start_x, start_y) đến (end_x, end_y)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}

Swipe Dob
    [Arguments]    ${YEAR_TARGET}    ${MONTH_TARGET}    ${DAY_TARGET}
    # Swipe năm cho đến khi đúng
    FOR    ${i}    IN RANGE    120
        ${year}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][3]    value
        Exit For Loop If    '${year}' == '${YEAR_TARGET}'
        Swipe    670    420   670    470
        ## Thêm thời gian chờ để cập nhật data
        Sleep    0.5s
    END
    ${actual_year}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][3]    value
    Log    ${actual_year}
    Should Be Equal As Strings    ${actual_year}    ${YEAR_TARGET}

    # Swipe tháng cho đến khi đúng
    FOR    ${i}    IN RANGE    12
        ${month}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][1]    value
        Exit For Loop If    '${month}' == '${MONTH_TARGET}'
        Swipe    450    420   450    470
        Sleep    0.5s
    END

    ${actual_month}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][1]    value
    Log    ${actual_month}
    Should Be Equal As Strings    ${actual_month}    ${MONTH_TARGET}

    # Swipe ngày cho đến khi đúng
    FOR    ${i}    IN RANGE    31
        ${day}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][2]    value
        Exit For Loop If    '${day}' == '${DAY_TARGET}'
        Swipe    550    420   550    470
        Sleep    0.5s
    END

    ${actual_day}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeOther[@value][2]    value
    Log    ${actual_day}
    Should Be Equal As Strings    ${actual_day}    ${DAY_TARGET}

    # Chọn Select để xác nhận
    AppiumLibrary.Click Element    //XCUIElementTypeStaticText[@value="Select"]

Swipe Dob Android Index
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
        Swipe    1073    492   1073    532
        Sleep    0.5s
    END
    Log    ${year}
    Should Be Equal As Strings    ${year}    ${YEAR_TARGET}

    # Swipe tháng
    FOR    ${i}    IN RANGE    12
        ${month}=    AppiumLibrary.Get Element Attribute    ${month_seekbar}    content-desc
        Exit For Loop If    '${month}' == '${MONTH_TARGET}'
        Swipe    900    497   900    537
        Sleep    0.5s
    END
    Log    ${month}
    Should Be Equal As Strings    ${month}    ${MONTH_TARGET}

    # Swipe ngày
    FOR    ${i}    IN RANGE    31
        ${day}=    AppiumLibrary.Get Element Attribute    ${day_seekbar}    content-desc
        Exit For Loop If    '${day}' == '${DAY_TARGET}'
        Swipe    1004    488   1004    528
        Sleep    0.5s
    END
    Log    ${day}
    Should Be Equal As Strings    ${day}    ${DAY_TARGET}

    AppiumLibrary.Click Element    //android.view.View[@content-desc="Select"]


Swipe find image
    [Arguments]    ${target_label}
    FOR    ${i}    IN RANGE    20
        ${exists}=    Run Keyword And Return Status      AppiumLibrary.Element Should Be Visible    //XCUIElementTypeImage[@name="PXGGridLayout-Info" and @label="${target_label}"]
        Exit For Loop If    ${exists}
        Swipe    480    232   465    100
        Sleep    0.5s
    END
    ${Actual_image}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeImage[@name="PXGGridLayout-Info" and @label="${target_label}"]    label
    Should Be Equal As Strings    ${Actual_image}    ${target_label}
    AppiumLibrary.Click Element    //XCUIElementTypeImage[@name="PXGGridLayout-Info" and @label="${target_label}"]

Swipe find image Android
    [Arguments]    ${target_desc}
    FOR    ${i}    IN RANGE    20
        ${exists}=    Run Keyword And Return Status      AppiumLibrary.Element Should Be Visible    //android.widget.FrameLayout[@content-desc="${target_desc}"]
        Exit For Loop If    ${exists}
        Swipe    480    232   465    100
        Sleep    0.5s
    END
    ${Actual_image}=    AppiumLibrary.Get Element Attribute    //android.widget.FrameLayout[@content-desc="${target_desc}"]    content-desc
    Should Be Equal As Strings    ${Actual_image}    ${target_desc}
    AppiumLibrary.Click Element    //android.widget.FrameLayout[@content-desc="${target_desc}"]

Find and choose Technician
    [Arguments]    ${Technician}
    FOR    ${i}    IN RANGE    20
        ${exists}=    Run Keyword And Return Status      AppiumLibrary.Element Should Be Visible    //android.view.View[contains(@content-desc, "${Technician}")]
        Exit For Loop If    ${exists}
        AppiumLibrary.Click Element     //android.view.View[@content-desc="Next Page"]
        Sleep    0.5s
    END
    ${Actual_technician}=    AppiumLibrary.Get Element Attribute    //android.view.View[contains(@content-desc, "${Technician}")]    content-desc
    Should Contain    ${Actual_technician}    ${Technician}
    AppiumLibrary.Click Element    //android.view.View[contains(@content-desc, "${Technician}")]

Find and choose Technician IOS
    [Arguments]    ${Technician}
    FOR    ${i}    IN RANGE    20
        ${exists}=    Run Keyword And Return Status      AppiumLibrary.Element Should Be Visible    //XCUIElementTypeStaticText[contains(@name, "${Technician}")]

        Exit For Loop If    ${exists}
        AppiumLibrary.Click Element     //XCUIElementTypeStaticText[@name="Next Page"]
        Sleep    0.5s
    END
    ${Actual_technician}=    AppiumLibrary.Get Element Attribute    //XCUIElementTypeStaticText[contains(@name, "${Technician}")]    name
    Should Contain    ${Actual_technician}    ${Technician}
    AppiumLibrary.Click Element    //XCUIElementTypeStaticText[contains(@name, "${Technician}")]

Find Categories services
    [Arguments]    ${Services}
    FOR    ${i}    IN RANGE    20
        ${exists}=    Run Keyword And Return Status      AppiumLibrary.Element Should Be Visible       //android.view.View[contains(@content-desc, "${Services}")]
        Exit For Loop If    ${exists}
        AppiumLibrary.Click Element     //android.view.View[@content-desc="Next Page"]
        Sleep    0.5s
    END
    ${Actual_Services}=    AppiumLibrary.Get Element Attribute    //android.view.View[contains(@content-desc, "${Services}")]    content-desc
    Should Contain    ${Actual_Services}    ${Services}
    AppiumLibrary.Click Element    //android.view.View[contains(@content-desc, "${Services}")]


*** Variables ***
#Method#
${Method_POST}    POST
${Method_GET}    GET
${Method_PUT}    PUT
${Method_DELETE}    DELETE
#Method#

#Status Code API#
${Status_200}    200
${Status_201}    201
${Status_202}    202
${Status_401}    401
${Status_400}    400

#Boolean API#
${Boolean_True}    True
${Boolean_False}    False

