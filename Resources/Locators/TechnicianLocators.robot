*** Variables ***
### Android Locators ###
${btn_OpenCreateTechnician}          xpath=//android.view.View[@content-desc="Add New Technician"]
${btn_Submit_CreateTechnician}       css=button[type="submit"]
${btn_Cancel_CreateTechnician}       xpath=//button[normalize-space()="Cancel"]

# Inputs (giả định HTML structure — hãy thay bằng selectors thực tế)
${elm_input_IncomeRate_Tech_Android}    xpath=//android.view.View[contains(@hint, "Income Rate")]
${elm_input_FirstName_Tech}          css=input[name="firstName"], xpath=//label[contains(., "First Name")]/following::input[1]
${elm_input_LastName_Tech}           css=input[name="lastName"], xpath=//label[contains(., "Last Name")]/following::input[1]
${elm_input_Email_Tech}              css=input[name="email"]
${elm_input_Phone_Tech}              css=input[name="phone"]
${elm_input_Password_Tech}           css=input[name="password"]
${elm_input_RePassword_Tech}         css=input[name="rePassword"]
${elm_select_Gender_Tech}            css=select[name="gender"]
${elm_option_Gender_Male}            xpath=//select[@name="gender"]/option[normalize-space()="Male"]
${elm_input_Address_Tech}            css=input[name="address"]
${elm_input_City_Tech}               css=input[name="city"]
${elm_input_State_Tech}              css=input[name="state"]
${elm_input_Zipcode_Tech}            css=input[name="zipcode"]

# Validation message elements (thay selector nếu cần)
${elm_input_FirstName_Tech_Android}               xpath=//android.widget.EditText[contains(@hint, "First Name")]
${elm_error_LastName}                xpath=//input[@name="lastName"]/following::div[contains(@class,"error")][1]
${elm_error_Email}                   xpath=//input[@name="email"]/following::div[contains(@class,"error")][1]
${elm_error_Phone}                   xpath=//input[@name="phone"]/following::div[contains(@class,"error")][1]
${elm_error_RePassword}              xpath=//input[@name="rePassword"]/following::div[contains(@class,"error")][1]
${elm_success_CreateTechnician}      xpath=//div[contains(@class,"toast") or contains(@class,"alert-success")][1]
${elm_Title_CreateTechnician}        xpath=//h1[contains(., "Create Technician") or contains(., "Technician")]