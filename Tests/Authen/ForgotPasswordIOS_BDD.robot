*** Settings ***
Resource        ../../Resources/PageObject/RetrievePasswordPage/RetrievePasswordPage.robot
Resource        ../../TestData/LoginData/LoginData.robot
Suite Setup     Basic Setup iOS
Suite Teardown  Basic TearDowns iOS

*** Test Cases ***
Validate Forgot Password With Empty Email
    [Tags]    forgot_password    validation    empty_field
    [Documentation]    Kiểm tra validation khi không nhập email
    Given User is on Forgot Password screen
    When User clicks Continue
    Then System should display empty email error message

Validate Forgot Password With Invalid Email
    [Tags]    forgot_password    validation    invalid_email
    [Documentation]    Kiểm tra validation khi nhập email không tồn tại
    Given User is on Forgot Password screen
    When User enters email not exist
    And User clicks Continue
    Then System should display email not exist error message

Validate Forgot Password Success
    [Tags]    forgot_password    positive    success
    [Documentation]    Kiểm tra flow quên mật khẩu thành công
    Given User is on Forgot Password screen
    When Clear Text    //XCUIElementTypeTextField[@value="user@example.com"]
    And User enters email Valid and receives OTP
    And Verify New Password & Confirm Password iOS
    And User enters new password "School123@" and confirm password "School123@"
    And User clicks Continue
    Then System should display change password success message

*** Keywords ***
User is on Forgot Password screen
    [Documentation]    Điều hướng đến màn hình Quên mật khẩu
    Click on Element mobile     ${elm_forgot_password_iOS}

User clicks Continue
    [Documentation]    Click nút Continue
    Click on Element mobile    ${elm_btn_continue_iOS}

System should display empty email error message
    [Documentation]    Kiểm tra lỗi yêu cầu nhập email
    Should Contain    ${elm_error_empty_email_iOS}    ${Expected_emty_field_iOS}

User enters email not exist  
    [Documentation]    Nhập email vào trường email
    Fill Text Input mobile    ${elm_input_field_email_iOS}    user@example.com
    Click on Element mobile    ${elm_forgot_password_iOS}

System should display email not exist error message
    [Documentation]    Kiểm tra lỗi email không tồn tại
    Should Contain    ${elm_error_email_not_exist_iOS}    ${Expected_email_not_exist_iOS}

User enters email Valid and receives OTP
    Fill Text Input mobile    ${elm_input_field_email_iOS}    school@yopmail.com
    Click on Element mobile    ${elm_forgot_password_iOS}
    Click on Element mobile    ${elm_btn_continue_iOS}

User enters new password "${new}" and confirm password "${confirm}"
    Clear Text    //XCUIElementTypeTextField[@value="Password123"]
    Fill Text Input mobile    ${elm_field_new_password_iOS}    ${new}
    Click on Element mobile    ${elm_forgot_password_iOS}
    Clear Text    //XCUIElementTypeTextField[@value="Dev123!@#"]
    Fill Text Input mobile    ${elm_field_confirm_password_iOS}    ${confirm}
    Execute Script    mobile: tap    x=418    y=103

System should display change password success message
    [Documentation]    Kiểm tra thông báo đổi mật khẩu thành công
    Check validation error message mobile    ${elm_change_password_success_iOS}    ${Expected_Change_Password_Success_iOS} 