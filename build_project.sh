#!/bin/sh

echo build_project.sh has been run with the following arguments
echo "$@"

mkdir workspace

ls -la /opt/ti/ccs1100/ccs
ls -la /opt/ti/ccs1100/Code\ Composer\ Studio\ 11.0.0.desktop

eclipse -noSplash -data "workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location "$1"
eclipse -noSplash -data "workspace" -application com.ti.ccstudio.apps.projectBuild -ccs.projects "$2" --ccs.configuration "$3"
