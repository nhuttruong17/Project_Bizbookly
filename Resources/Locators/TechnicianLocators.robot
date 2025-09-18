*** Variables ***
### Android Locators ###
${btn_OpenCreateTechnician}          xpath=//android.view.View[@content-desc="Add New Technician"]
${btn_Submit}                       xpath=//android.view.View[@content-desc="Submit"]
${btn_Cancel_CreateTechnician}       xpath=//button[normalize-space()="Cancel"]
${btn_Done}                          xpath=//android.view.View[@content-desc="Done"]
${btn_Clear}                         xpath=//android.view.View[@content-desc="Clear"]

# Inputs (giả định HTML structure — hãy thay bằng selectors thực tế)
${elm_input_IncomeRate_Tech_Android}    xpath=//android.view.View[contains(@hint, "Income Rate")]
${elm_input_FirstName_Tech_Android}     xpath=//android.widget.EditText[@hint="First Name"]