Reverse Shell Backdoor
Overview
This repository contains a PowerShell script implementing a reverse shell backdoor using the Invoke-ReverseShellBackdoor function. The script establishes a persistent connection to a specified IP address and port, allowing remote command execution on the compromised system.

Features
Persistent Connection: The script attempts to reconnect every 5 seconds if the connection is lost.
Command Execution: Executes commands received from the remote server and sends back the output.
Error Handling: Captures and logs errors that occur during the connection and command execution.
Steps to run:
1.Install netcat on your computer "nmap.org"
2.Run the program "netcat-reverse-backdoor.bat" on the attacker's computer
3.As the receiver,go to command prompt and run ncat -l -p "your_port"
*note: i wouldnt take responsible for any damages*
