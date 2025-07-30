*** Variables ***
${BASE_URL}           https://app.dev.salonbookly.com/
${CHROME_BROWSER}     Chrome

#Appium iOS
${APPIUM_SERVER_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}        iOS
${AUTOMATION_NAME}      XCUITest
${UDID_iPad_Huy}        00008020-00122CA002F1402E
${UDID_iPad_Danh}       00008112-001848D60E78201E
${BUNDLE_ID}            com.bizbookly.manager.dev

#Appium Android
${PLATFORM_NAME_Android}    Android
${AUTOMATION_NAME_Android}  UiAutomator2
${UDID_Android}             192.168.31.159:43877
${APP_PACKAGE}              com.bizbookly.manager.dev
${APP_ACTIVITY}             com.bizbookly.manager.MainActivity
