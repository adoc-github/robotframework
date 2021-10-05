*** Settings ***
Library           lib/CloudShellAPILibrary.py	${CloudShellAddress}	${User}	${AuthToken}	${Domain}	${sandbox.id}

Documentation     A test suite containing one test that sleeps for a while.
...		  The suite should pass successfully.

*** Variables ***
${CloudShellAddress}
${User}
${AuthToken}
${Domain}	Global
${duration}	5
${config_file_location}	ftp://192.168.90.202/TeraVM/HTTP_Request.xml
${use_ports_from_reservation}	false
${command_params}	Create Dictionary	config_file_location=${config_file_location}	use_ports_from_reservation=${use_ports_from_reservation}

*** Test Case ***
Hello World with Delay
	Sleep for duration	${duration}
	Print	Hello World
	Print to Sandbox	Hello World from the Sandbox Output
	Load TeraVM Scenario	${command_params}

*** Keywords ***
Print
	[Arguments]	${text}
	Log	${text}

Print to Sandbox
	[Arguments]	${message}
	CloudShellAPILibrary.Write Sandbox Message	${message}

Sleep for duration
	[Arguments]	${duration}
	sleep	${duration}s

Load TeraVM Scenario
	[Arguments]	${command_params}
	CloudShellAPILibrary.Execute Command	TeraVM Controller Shell 2G	Service	load_config	${command_params}

