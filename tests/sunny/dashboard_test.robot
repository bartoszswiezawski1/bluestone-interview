*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource
Resource            ../../resources/common.resource

Suite Setup         Logged in user
Suite Teardown      Browser close
Test Teardown       Reload Page


*** Test Cases ***
Full content
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    10
    Visual check    dashboard.png
    Click Element    ${NEXT_PAGE}
    Visual check    dashboard_2.png

Search with first name
    Input Text    ${SEARCH_INPUT}    Jon
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    2
    Element Text Should Be    ${DATA_0_0}    1
    Element Text Should Be    ${DATA_0_1}    Jon
    Element Text Should Be    ${DATA_0_2}    Snow
    Element Text Should Be    ${DATA_0_3}    35
    Element Text Should Be    ${DATA_0_4}    Jon Snow
    Visual check    search.png

Search with last name
    Input Text    ${SEARCH_INPUT}    Snow
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    2
    Element Text Should Be    ${DATA_0_0}    1
    Element Text Should Be    ${DATA_0_1}    Jon
    Element Text Should Be    ${DATA_0_2}    Snow
    Element Text Should Be    ${DATA_0_3}    35
    Element Text Should Be    ${DATA_0_4}    Jon Snow
    Visual check    search.png

Sort desc by ID
    Click Element    ${ID_COLUMN_HEADER}
    Click Element    ${ID_COLUMN_HEADER}
    Element Text Should Be    ${DATA_0_0}    9

Sort desc by first name
    Click Element    ${FIRST_NAME_COLUMN_HEADER}
    Click Element    ${FIRST_NAME_COLUMN_HEADER}
    Element Text Should Be    ${DATA_0_1}    Rossini

Sort asc by last name
    Click Element    ${LAST_NAME_COLUMN_HEADER}
    Element Text Should Be    ${DATA_0_2}    Clifford

Sort desc by age
    Click Element    ${AGE_COLUMN_HEADER}
    Click Element    ${AGE_COLUMN_HEADER}
    Element Text Should Be    ${DATA_0_3}    150

Switch light mode
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: light;
    Click Element    ${MODE_BUTTON}
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: dark;

Logout
    Click Element    ${ACCOUNT_BUTTON}
    Click Element    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Element Text Should Be    ${EMAIL_INPUT}    ${EMPTY}
    Element Text Should Be    ${PASSWORD_INPUT}    ${EMPTY}
