*** Settings ***
Resource            ../../resources/common.resource
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource

Test Setup          Browser setup
Test Teardown       Browser close


*** Test Cases ***
Log in successfully
    Log in
    Wait Until Element Is Visible    ${ACCOUNT_BUTTON}
    Element Should Not Be Visible    ${EMAIL_INPUT}
    Visual check    dashboard.png

Switch light mode
    Visual check    login.png
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: light;
    Click Element    ${MODE_BUTTON}
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: dark;
    Visual check    login_dark.png
