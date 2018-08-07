#!/bin/bash
OS=`uname`
LOGIN=$(id -un);
HOME="/Users/"$LOGIN
GOINFRE="/Volumes/Storage/goinfre/"$LOGIN;
DOCKER_FOLDER=".docker"
DOCKER_HOME=$HOME"/"$DOCKER_FOLDER
DOCKER_GOINFRE=$GOINFRE"/"$DOCKER_FOLDER

setup_docker() {
	if [ "$OS" = 'Darwin' ]; then
		if !(brew ls --versions docker > /dev/null); then
			brew update
			brew install docker && \
			echo "Docker has been installed"
		else
			echo "Docker is already installed"
		fi
	fi
}

setup_virtualbox() {
	if [ "$OS" = 'Darwin' ]; then
		if !(vboxmanage -v > /dev/null); then
			echo "Error: VirtualBox is not installed on this machine"
			echo "       Please install 'Oracle VM VirtualBox' with Managed Software Center"
			exit 1
		else
			echo "VirtualBox is already installed"
		fi
	fi
}

mv_dockerfolder() {
	if [ ! -d $DOCKER_GOINFRE ]; then
		if [ ! -d $DOCKER_HOME ]; then
			echo "mkdir $DOCKER_GOINFRE"
			mkdir $DOCKER_GOINFRE
		else
			echo "cp -R $DOCKER_HOME $GOINFRE"
			cp -R $DOCKER_HOME $GOINFRE
		fi
	else
		echo "$DOCKER_GOINFRE already exists"
	fi
	echo "rm -Rf $DOCKER_HOME"
	rm -Rf $DOCKER_HOME
	echo "ln -s $DOCKER_GOINFRE $DOCKER_HOME"
	ln -s $DOCKER_GOINFRE $DOCKER_HOME
}

vm_default_folder() {
	vboxmanage setproperty machinefolder $GOINFRE
	echo "vboxmanage setproperty machinefolder $GOINFRE"
}

setup_docker
setup_virtualbox
vm_default_folder
mv_dockerfolder