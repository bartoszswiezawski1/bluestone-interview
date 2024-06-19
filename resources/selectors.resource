*** Variables ***
${EMAIL_INPUT}      name:email
${PASSWORD_INPUT}   name:password
${LOGIN_BUTTON}     //button[contains(text(), 'Log in')]
${LOGOUT_BUTTON}    //*[local-name()='li' and @role='menuitem']
${ACCOUNT_BUTTON}   //*[local-name()='svg' and @data-testid='AccountCircleOutlinedIcon']
${MODE_BUTTON}      //*[local-name()='svg' and @data-testid='LightModeOutlinedIcon']
${NEXT_PAGE}        //*[local-name()='svg' and @data-testid='KeyboardArrowRightIcon']
${SEARCH_INPUT}     id:search-input
${GRID}             //*[local-name()='div' and @role='grid']
${ROW_COUNT}        aria-rowcount
${DATA_0_0}         //*[local-name()='div' and @role='cell' and @data-colindex=0]
${DATA_0_1}         //*[local-name()='div' and @role='cell' and @data-colindex=1]
${DATA_0_2}         //*[local-name()='div' and @role='cell' and @data-colindex=2]
${DATA_0_3}         //*[local-name()='div' and @role='cell' and @data-colindex=3]
${DATA_0_4}         //*[local-name()='div' and @role='cell' and @data-colindex=4]
${HTML}             //*[local-name()='html']
${INPUT_ERROR}      //p[contains(@class, 'Mui-error')]
${INVALID_CREDENTIALS_ERRROR}		//div[contains(@class, 'MuiAlert-message')]
${ID_COLUMN_HEADER}     //*[local-name()='div' and @aria-label='ID']
${FIRST_NAME_COLUMN_HEADER}     //*[local-name()='div' and @aria-label='First name']
${LAST_NAME_COLUMN_HEADER}     //*[local-name()='div' and @aria-label='Last name']
${AGE_COLUMN_HEADER}     //*[local-name()='div' and @aria-label='Age']