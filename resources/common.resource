*** Settings ***
Library     DocTest.VisualTest
Library     SeleniumLibrary


*** Keywords ***
Browser setup
    Open Browser    url=${URL}    browser=${BROWSER}
    Set Window Size    1920    1080

Log in
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${ACCOUNT_BUTTON}
    Sleep    200ms

Visual check
    [Arguments]    ${file_name}
    Sleep    100ms
    Capture Page Screenshot    ${CURDIR}/screenshots/current_${file_name}
    ${threshold}    Set Variable If    "headlesschrome" != "${BROWSER}"    0.1    0.01
    Compare Images
    ...    ${CURDIR}/screenshots/expected_${file_name}
    ...    ${CURDIR}/screenshots/current_${file_name}
    ...    resize_candidate=True
    ...    threshold=${threshold}

Browser close
    Close Browser

Logged in user
    Browser setup
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${ACCOUNT_BUTTON}
    Sleep    200ms
