#!/bin/sh -l

echo "build_project.sh has been run with the following arguments"
echo "$@"

echo "permissions"
id

echo "entry point"
ls -la

echo "source directory"
ls -la "$1"

echo "installation dir"
ls -la /opt/ti/ccs1100/ccs

echo "import project into workspace"
echo "/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "./$1/""
echo 
/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "./$1/" | tr -d '\r'

echo "build project"
echo "/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.projects "./$2/" --ccs.configuration "$3""
echo
/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.projects "./$2/" --ccs.configuration "$3" | tr -d '\r'
