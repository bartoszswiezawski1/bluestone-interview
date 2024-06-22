*** Settings ***
Library     SeleniumLibrary
Resource    common.resource
Resource    selectors.resource


*** Keywords ***
Input username
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Input password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click login button
    Click Button    ${LOGIN_BUTTON}

Log in successfully
    Browser setup
    Input username    ${EMAIL}
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${DATA_0_0}
