*** Settings ***
Library     DocTest.VisualTest
Library     SeleniumLibrary
Resource    config.resource
Resource    selectors.resource


*** Keywords ***
Browser setup
    Open Browser    url=${URL}    browser=${BROWSER}
    Set Window Size    ${WIDTH}    ${HEIGHT}

Visual check
    [Arguments]    ${file_name}
    Sleep    50ms
    Capture Page Screenshot    ${CURDIR}/screenshots/current_${file_name}
    ${threshold}    Set Variable If
    ...    "headlesschrome" != "${BROWSER}"
    ...    ${NON_HEADLESS_THRESHOLD}
    ...    ${HEADLESS_THRESHOLD}
    Compare Images
    ...    ${CURDIR}/screenshots/expected_${file_name}
    ...    ${CURDIR}/screenshots/current_${file_name}
    ...    resize_candidate=True
    ...    threshold=${threshold}

Click light mode button
    Click Element    ${MODE_BUTTON}

Browser close
    Close Browser
