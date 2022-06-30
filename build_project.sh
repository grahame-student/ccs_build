#!/bin/sh -l

####################################
###   Helper Functions Go Here   ###
####################################

# Check CCS project files exist at specified location
Check_CCS_Project_Files() {
    file1="$1/.project"
    file2="$1/.cproject"
    file3="$1/.ccsproject"

    if [ -a $file1 ] && [ -a $file2 ] && [ -a $file3 ]
    then echo "CCS project files found"
    else echo "CCS project files not found" && exit 1
    fi
}



####################################
### Main Action Code Starts Here ###
####################################
Check_CCS_Project_Files $1

echo import project into workspace
/opt/ti/ccs1100/ccs/eclipse/eclipse -noSplash -data "/home/build/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "$1"

echo build project
/opt/ti/ccs1100/ccs/eclipse/eclipse -noSplash -data "/home/build/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.workspace --ccs.configuration "$3"
