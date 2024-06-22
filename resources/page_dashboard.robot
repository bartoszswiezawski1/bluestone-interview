*** Settings ***
Library     SeleniumLibrary
Resource    common.resource
Resource    selectors.resource


*** Keywords ***
Input dashboard search
    [Arguments]    ${search}
    Input Text    ${SEARCH_INPUT}    ${search}

Click dashboard next page button
    Click Element    ${NEXT_PAGE}

Click ID column header
    Click Element    ${ID_COLUMN_HEADER}

Click first name column header
    Click Element    ${FIRST_NAME_COLUMN_HEADER}

Click last name column header
    Click Element    ${LAST_NAME_COLUMN_HEADER}

Click age column header
    Click Element    ${AGE_COLUMN_HEADER}

Select first row
    Click Element    ${DATA_0_0}

Logout
    Click Element    ${ACCOUNT_BUTTON}
    Click Element    ${LOGOUT_BUTTON}
