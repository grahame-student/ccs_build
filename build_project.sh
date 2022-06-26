#!/bin/sh -l

echo build_project.sh has been run with the following arguments
echo "$@"

echo import project into workspace
/opt/ti/ccs1100/ccs/eclipse/eclipse -noSplash -data "/home/build/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "$1"

echo build project
/opt/ti/ccs1100/ccs/eclipse/eclipse -noSplash -data "/home/build/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.workspace --ccs.configuration "$3"
