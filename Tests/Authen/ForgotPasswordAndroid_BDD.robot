*** Settings ***
Resource            ../../Resources/Locators/RetrievePasswordLocator.robot
Resource            ../../TestData/LoginData/LoginData.robot
Resource            ../../TestKeyWords/Common.robot
Resource            ../../Resources/PageObject/RetrievePasswordPage/RetrievePasswordPage.robot
Suite Setup         Basic Setup Android
Suite Teardown      Basic TearDowns Android
Documentation       BDD Structure for Android Forgot Password Flow

*** Test Cases ***
Validate Forgot Password With Empty Email
    [Tags]    forgot_password    validation    empty_field
    [Documentation]    Kiểm tra validation khi không nhập email
    Given User is on Forgot Password screen
    When User clicks Continue without entering email
    Then System should display empty email error message

Validate Forgot Password With Invalid Email
    [Tags]    forgot_password    validation    invalid_email
    [Documentation]    Kiểm tra validation khi nhập email không tồn tại
    Given User is on Forgot Password screen
    When User enters email "user@example.com"
    And User clicks Continue
    Then System should display email not exist error message


Validate Forgot Password Success
    [Tags]    forgot_password    positive    success
    [Documentation]    Kiểm tra flow quên mật khẩu thành công
    Given User is on Forgot Password screen     
    When Click And Clear Field      user@example.com
    And User enters email "${Email_school}"
    And User clicks Continue
    And Verify New Password & Confirm Password Android
    And User enters new password "${Valid_Password}" and confirm password "${Valid_Password}"
    And User clicks Confirm Change Password
    Then System should display change password success message

*** Keywords ***
User is on Forgot Password screen
    [Documentation]    Điều hướng đến màn hình Quên mật khẩu
    Click on Element mobile     ${elm_forgot_password_android}

User clicks Continue without entering email
    [Documentation]    Click nút Continue khi chưa nhập email
    Click on Element mobile    ${elm_btn_continue_android}

System should display empty email error message
    [Documentation]    Kiểm tra lỗi yêu cầu nhập email
    Should Contain    ${elm_error_empty_email_android}    ${Expected_emty_field_android}

User enters email "${email}"  
    [Documentation]    Nhập email vào trường email
    Click on Element mobile    ${elm_input_field_email_android}
    Fill Text Input mobile    ${elm_input_field_email_android}    ${email}
    Click on Element mobile    ${elm_forgot_password_android}

User clicks Continue
    [Documentation]    Click nút Continue
    Click on Element mobile    ${elm_btn_continue_android}

System should display email not exist error message
    [Documentation]    Kiểm tra lỗi email không tồn tại
    Should Contain    ${elm_error_email_not_exist_android}    ${Expected_email_not_exist_android}

User enters new password "${new}" and confirm password "${confirm}"
    [Documentation]    Nhập mật khẩu mới và xác nhận
    Click And Clear Field       Password123
    Click on Element mobile     ${elm_field_new_password_android}
    Fill Text Input mobile      ${elm_field_new_password_android}    ${new}
    Click And Clear Field       Dev123!@#
    Click on Element mobile     ${elm_field_confirm_password_android}
    Fill Text Input mobile      ${elm_field_confirm_password_android}    ${confirm}
    Click on Element mobile     ${elm_forgot_password_android}

User clicks Confirm Change Password
    [Documentation]    Click xác nhận đổi mật khẩu
    Click on Element mobile    ${elm_btn_continue_android}

System should display change password success message
    [Documentation]    Kiểm tra thông báo đổi mật khẩu thành công
    Should Contain    ${elm_change_password_success_android}    ${Expected_Change_Password_Success_android} 