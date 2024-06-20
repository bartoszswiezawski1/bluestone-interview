# Project setup 
* Create virtual environment and install from requirements.txt file - https://docs.python.org/3/library/venv.html
* Example commands for MacOS
    - ```python3 -m venv env```
    - ```source env/bin/activate```
    - ```pip3 install -r requirements.txt``` 

# Project structure
* `resources`
  * `screenshots.*` - expected screenshots to compare in visual check with freshly generated ones
  * `common.resource` - common keywords which can be used by test cases/suites
  * `selectors.resource` - selectors/locators to find elements
* `tests`
  * `rainy` - rainy day scenarios, negative test cases
  * `sunny` - sunny day scenarios, positive test cases

# Supported browsers
* chrome 
* headless chrome

# Test execution
* ```robot tests``` - all tests in non-parallel mode
* ```pabot ---processes 4 tests``` - all tests in parallel mode (recommended)
* ```robot tests/sunny/login_test.robot``` - single test suite
* ```robot -t Switch\ light\ mode tests/sunny/login_test.robot``` - single test case

# Test results
* command line test execution summary
* log.html and report.html files generated in execution directory

# Code cleanup
* before commiting changes please reformat code with ```robotidy .```