*** Settings ***
Resource    ../../Locators/LoginLocators.robot
Resource    ../../../TestData/LoginData/LoginData.robot
Resource    ../../../TestKeyWords/Common.robot
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
Library    ../../../LibPy/FinalNetwork.py

*** Keywords ***

##Check API ##
#Function check login successfully with api
Check Loggin successfully with API
    ${response}=    API Request   ${Method_POST}   ${API_URL_SignIn}   ${PAYLOAD_SUCCESS}   ${Status_201}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${message}=    Get From Dictionary    ${json}    message
    Should Be Equal As Strings   ${message}    ${EXPECTED_SUCCESS_MESSAGE_API}
#Function check login failed with api
Check Login unsuccessfully with API
    ${response}=   API Request   ${Method_POST}   ${API_URL_SignIn}   ${PAYLOAD}   ${Status_401}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${error_code}=    Get From Dictionary    ${json['data']}    code
    Should Be Equal As Strings    ${error_code}    ${EXPECTED_ERROR_MESSAGE_API}
#Function check error message account inactive with api
Check Login account inactive with API
    ${response}=   API Request   ${Method_POST}   ${API_URL_SignIn}   ${PAYLOAD_UserInactive}   ${Status_401}
    ${json}=    Evaluate    json.loads('''${response.content}''')    modules=json
    ${error_code}=    Get From Dictionary    ${json['data']}    code
    Should Be Equal As Strings    ${error_code}    ${EXPECTED_ERROR_MESSAGE_API_inactive}


