*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource
Resource            ../../resources/common.resource
Resource            ../../resources/page_login.robot
Resource            ../../resources/page_dashboard.robot

Suite Setup         Log in successfully
Suite Teardown      Browser close
Test Teardown       Reload Page


*** Test Cases ***
Full content
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    10
    Visual check    dashboard.png
    Click dashboard next page button
    Visual check    dashboard_2.png

Search with first name
    Input dashboard search    Jon
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    2
    Element Text Should Be    ${DATA_0_0}    1
    Element Text Should Be    ${DATA_0_1}    Jon
    Element Text Should Be    ${DATA_0_2}    Snow
    Element Text Should Be    ${DATA_0_3}    35
    Element Text Should Be    ${DATA_0_4}    Jon Snow
    Visual check    search.png

Search with last name
    Input dashboard search    Snow
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    2
    Element Text Should Be    ${DATA_0_0}    1
    Element Text Should Be    ${DATA_0_1}    Jon
    Element Text Should Be    ${DATA_0_2}    Snow
    Element Text Should Be    ${DATA_0_3}    35
    Element Text Should Be    ${DATA_0_4}    Jon Snow
    Visual check    search.png

Sort desc by ID
    Click ID column header
    Click ID column header
    Element Text Should Be    ${DATA_0_0}    9

Sort desc by first name
    Click first name column header
    Click first name column header
    Element Text Should Be    ${DATA_0_1}    Rossini

Sort asc by last name
    Click last name column header
    Element Text Should Be    ${DATA_0_2}    Clifford

Sort desc by age
    Click age column header
    Click age column header
    Element Text Should Be    ${DATA_0_3}    150

Select row
    Select first row
    Element Text Should Be    ${GRID_FOOTER}    1 row selected

Switch light mode
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: light;
    Click light mode button
    Element Attribute Value Should Be    ${HTML}    style    color-scheme: dark;

Logout
    Logout
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Element Text Should Be    ${EMAIL_INPUT}    ${EMPTY}
    Element Text Should Be    ${PASSWORD_INPUT}    ${EMPTY}
