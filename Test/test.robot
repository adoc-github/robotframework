*** Settings ***
Documentation     A test suite containing one test that should pass.
*** Test Case ***
Should pass
	Right condition

*** Keywords ***
Right condition
    Should Be Equal 	0 	0
