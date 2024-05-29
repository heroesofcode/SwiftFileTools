#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
   
    swift_version=$(swift --version 2>/dev/null)

    if [ $? -eq 0 ]; then
        echo "Swift installed. Version detected:"
        echo "$swift_version"
        
	echo

        echo "Running SwiftFileTools"
        swift run SwiftFileTools
    else
        echo "Swift is not installed. Please install Swift to continue"
    fi
else
    echo "This script is for macOS only"
fi


