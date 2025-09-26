*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

Suite Teardown    Upload Results To Jira

*** Variables ***
${BASE_URL}        https://jira.yourdomain.com/rest/api/2
${AIO_URL}         https://jira.yourdomain.com/rest/aio/testmanagement/1.0/execution
${USERNAME}        truong.ln@exnodes.vn
${API_TOKEN}       your_api_token
${CYCLE_KEY}       CYCLE-123        # Cycle chứa test case bạn muốn map

*** Test Cases ***
Test Case Pass Example
    [Documentation]    Case này pass
    Should Be Equal As Integers    1    1

Test Case Fail Example
    [Documentation]    Case này fail để demo
    Should Be Equal As Integers    1    2

*** Keywords ***
Upload Results To Jira
    [Documentation]    Teardown này sẽ chạy sau khi suite kết thúc
    ${results}=    Get Test Results
    FOR    ${result}    IN    @{results}
        Log    Gửi kết quả của ${result['name']} với status ${result['status']}
        ${body}=    Create Dictionary
        ...    cycleKey=${CYCLE_KEY}
        ...    testCase=${result['name']}
        ...    status=${result['status']}
        Create Session    jira    ${AIO_URL}    auth=${USERNAME}:${API_TOKEN}
        ${resp}=    Post Request    jira    /updateResult    json=${body}
        Log    Response: ${resp.text}
    END

Get Test Results
    [Documentation]    Lấy thông tin result từ biến test suite
    ${results}=    Create List
    # Trong thực tế bạn sẽ parse kết quả từ Robot biến ${TEST_STATUS}
    # Ở đây demo hardcode
    ${pass}=    Create Dictionary    name=Test Case Pass Example    status=Pass
    ${fail}=    Create Dictionary    name=Test Case Fail Example    status=Fail
    Append To List    ${results}    ${pass}
    Append To List    ${results}    ${fail}
    [Return]    ${results}