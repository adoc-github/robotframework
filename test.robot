*** Settings ***
Library    Collections

*** Test Case ***
Print sandbox id and 1st global input
	print sandbox id      ${sandbox.id}
	print 1st global input		 ${sandbox.global_inputs}

*** Keywords ***
print sandbox id
	[Arguments]    ${id}
    Log To Console			${id}
print 1st global input
	[Arguments]    ${global_inputs}
	${num} = 	Get From List 	${global_inputs} 	0
    Log To Console			${num.value}