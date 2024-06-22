*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/common.resource
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource
Resource            ../../resources/page_login.robot

Suite Setup         Browser setup
Suite Teardown      Browser close
Test Teardown       Reload Page


*** Test Cases ***
Get error for login without email and password
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login without email
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with invalid email format
    Input username    invalid@email
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with blank email
    Input username    ${EMPTY}
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with white space email
    Input username    ${SPACE}
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Email is not valid

Get error for login with invalid email
    Input username    invalid@email.com
    Input password    ${PASSWORD}
    Click login button
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERRROR}
    Element Text Should Be    ${INVALID_CREDENTIALS_ERRROR}    Invalid email or password

Get error for login without password
    Input username    ${EMAIL}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Please enter your password

Get error for login with blank password
    Input username    ${EMAIL}
    Input password    ${EMPTY}
    Click login button
    Wait Until Element Is Visible    ${INPUT_ERROR}
    Element Text Should Be    ${INPUT_ERROR}    Please enter your password

Get error for login with white space password
    Input username    ${EMAIL}
    Input password    ${SPACE}
    Click login button
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERRROR}
    Element Text Should Be    ${INVALID_CREDENTIALS_ERRROR}    Invalid email or password

Get error for login with invalid password
    Input username    ${EMAIL}
    Input password    invalid
    Click login button
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERRROR}
    Element Text Should Be    ${INVALID_CREDENTIALS_ERRROR}    Invalid email or password
