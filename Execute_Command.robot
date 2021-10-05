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

*** Test Case ***
Hello World with Delay
	Print	Hello World
	Print to Sandbox	Hello World from the Sandbox Output
	${command_params}=	Create Dictionary	config_file_location=${config_file_location}	use_ports_from_reservation=${use_ports_from_reservation}
	Load TeraVM Scenario	${command_params}
	Start TeraVM Scenario
	Sleep for duration	${duration}
	Stop TeraVM Scenario
	Sleep for duration	${duration}

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

Start TeraVM Scenario
	CloudShellAPILibrary.Execute Command	TeraVM Controller Shell 2G	Service	start_traffic

Stop TeraVM Scenario
	CloudShellAPILibrary.Execute Command	TeraVM Controller Shell 2G	Service	stop_traffic
	CloudShellAPILibrary.Execute Command	TeraVM Controller Shell 2G	Service	get_statistics
	${file_path} = 	CloudShellAPILibrary.Get Sandbox File Attachment	Test Group Results.zip
	Log File	${file_path}

