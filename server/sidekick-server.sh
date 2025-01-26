#!/bin/bash

#Greeting on startup
echo
echo "Starting Sidekick - Path of Exile 2 Market Tool"
echo "To begin initialization, please visit the following address in your web browser: http://localhost:5000/"
echo

#Execute dotnet
dotnet ./bin/Debug/net8.0/Sidekick.dll
