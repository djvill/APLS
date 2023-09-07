#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
currentDir=$(pwd)
if [ "$currentDir" != "$SCRIPT_DIR" ]
  then 
	  echo "Wrong folder! Please navigate to $SCRIPT_DIR"
	  read -p "Press any key to continue."
		exit 1
fi

# outFiles='c("aplsDict.txt", "custom-entries.md")'
outFiles='c("the.best")'
Rscript -e "source('convertDict.R') ; convertDict('APLS-dict.csv', $outFiles, skip=7)"
