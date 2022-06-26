#!/bin/sh -l

echo build_project.sh has been run with the following arguments
echo "$@"

echo permissions
id

echo working directory
ls -la

echo installation dir
ls -la /opt/ti/ccs1100/ccs

echo import project into workspace
echo /opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "./$1/"
echo 
/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "./$1/"

echo build project
echo /opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.projects "./$2/" --ccs.configuration "$3"
echo
/opt/ti/ccs1100/ccs/eclipse -noSplash -data "/workspace" -application com.ti.ccstudio.apps.projectBuild  -ccs.projects "./$2/" --ccs.configuration "$3"
