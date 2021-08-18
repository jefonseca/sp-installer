#!/bin/bash
## URL
installer_repository="https://github.com/jefonseca/sp-installer.git"
installer_repository_directory="sp-installer"

check_result () {
	if [[ $1 -ne 0 ]]; then
		echo "$2"
		exit 1
	fi
}

## Install ansible if needed
dpkg -s ansible >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
	sudo apt update ; sudo apt -y install ansible
	check_result $? "Cannot install ansible"
fi
if [[ ! $(which ansible-playbook) ]]; then
	echo "FATAL: \"ansible-playbook\" was not found in the system"
	exit 1
fi

## Install git if needed
dpkg -s git >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
	sudo apt update ; sudo apt -y install git
	check_result $? "Cannot install git"
fi
if [[ ! $(which git) ]]; then
	echo "FATAL: \"git\" was not found in the system"
	exit 1
fi

if [ ! -d "$installer_repository_directory" ]; then
	## clone repository
	git clone $installer_repository $installer_repository_directory
	check_result $? "Cannot clone repository"
else
	echo "Repository directory \"installer_repository_directory\" exists"
fi

## Run playbook
ANSIBLE_LOCALHOST_WARNING=false ansible-playbook $installer_repository_directory/install.yml
check_result $? "Playbook failed"