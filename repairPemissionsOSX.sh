#!/bin/bash

# Variables initialisation
version="munkiConditionsSSD v0.1 - 2016, Yvan Godard [godardyvan@gmail.com]"
versionOSX=$(sw_vers -productVersion)
scriptDir=$(dirname "${0}")
scriptName=$(basename "${0}")
scriptNameWithoutExt=$(echo "${scriptName}" | cut -f1 -d '.')
SystemOSMajor=$(echo ${versionOSX} | awk -F "." '{print $1}')
SystemOSMinor=$(echo ${versionOSX} | awk -F "." '{print $2}')

# Exécutable seulement par root
if [ `whoami` != 'root' ]
	then
	echo "Ce script doit être utilisé par le compte root. Utilisez 'sudo'."
	exit 1
fi

echo ""
echo "****************************** `date` ******************************"
echo "${scriptName} démarré, sur Mac OSX version ${versionOSX}"
echo ""

# Repair from 10.6 to 10.10
[[ ${SystemOSMinor} -gt 5 ]] && [[ ${SystemOSMinor} -lt 11 ]] && sudo diskutil repairPermissions /

# Repair Disk Permissions in OS X El Capitan
[[ ${SystemOSMinor} -ge 11 ]] && sudo /usr/libexec/repair_packages --repair --standard-pkgs --volume /

exit 0