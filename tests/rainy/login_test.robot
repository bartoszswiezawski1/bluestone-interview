*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/common.resource
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource

Suite Setup         Browser setup
Suite Teardown      Browser close
Test Teardown       Reload Page


*** Test Cases ***
Get error for login without email and password
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login without email
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with invalid email format
    Input Text    ${EMAIL_INPUT}    invalid@email
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with invalid email
    Input Text    ${EMAIL_INPUT}    invalid@email.com
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERRROR}
    Element Text Should Be    ${INVALID_CREDENTIALS_ERRROR}    Invalid email or password

Get error for login without password
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Please enter your password

Get error for login with invalid password
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Input Text    ${PASSWORD_INPUT}    invalid
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERRROR}
    Element Text Should Be    ${INVALID_CREDENTIALS_ERRROR}    Invalid email or password
