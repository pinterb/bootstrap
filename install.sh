#!/usr/bin/env bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Brad Pinter <brad.pinter@gmail.com>
#
# Description:
#   A bash script used to install a system bootstrap environment for Ubuntu (13.04)
#
#

#----- ENV VARIABLES -----#
RR_MODULES_DIR=$HOME/projects/github/rerun-modules

#----- FUNCTIONS -----#

# HELP 
function usage
{
    echo "To install the bootstrap scripts, run:"
    echo ""
    echo "./install.sh"
    echo "    -h --help"
    echo "    --rerun-modules-dir=$RR_MODULES_DIR"
    echo ""
}

# REQUIRED PACKAGES 
function packages {
    
    # Packages required to perform installation of bootstrap
    PACKAGES=(git wget curl)
   
    echo
    echo "Installing Ubuntu packages required to perform installation of bootstrap..."
    echo "Requires root privileges:"
    echo

    for i in ${PACKAGES[@]}; do
	sudo apt-get install -y --no-install-recommends ${i}
    done

    echo
    echo "Ubuntu package installation completed."
}


# INSTALL RERUN SHELL FRAMEWORK 
function reruninstall {

    # Installation directory for Rerun executable
    RR_HOME_DIR=/usr/bin

    echo 
    echo "Cloning rerun repo..."
    cd /tmp; rm -rf rerun; git clone git://github.com/rerun/rerun.git

    echo
    echo "Installing rerun script in ${RR_HOME_DIR}"
    
    sudo cp /tmp/rerun/rerun ${RR_HOME_DIR}/
    
    echo
    echo "Rerun installation completed."
}


# SET UP RERUN MODULES 
function rerunconfig {

    if [ $RR_MODULES_DIR == $HOME ]; then
        echo
        echo "Your Rerun modules directory can not be $HOME"
        echo "Perhaps you intended to choose a sub-directory under $HOME ?"
        echo
        usage
        exit 1
    fi

    echo 
    echo "Configuring Rerun..."
    echo
    echo "Will install rerun modules at ${RR_MODULES_DIR}"
    mkdir -p $RR_MODULES_DIR
    RR_REPO_CLONE_NAME=`basename ${RR_MODULES_DIR}`
    echo

    mkdir -p $RR_MODULES_DIR; cd $RR_MODULES_DIR; cd ..; rm -rf $RR_MODULES_DIR
    git clone git://github.com/pinterb/rerun-modules.git $RR_REPO_CLONE_NAME
    cp -r /tmp/rerun/modules/stubbs ${RR_MODULES_DIR}

    # Update profile.d 
    echo "Update /etc/profile.d/ with rerun module directory"
    sudo tee /etc/profile.d/rerun.sh >/dev/null << EOF
#!/bin/sh
export RERUN_HOME=/usr/bin
export RERUN_MODULES=${RR_MODULES_DIR}
EOF

    source /etc/profile.d/rerun.sh
    echo
    echo "Rerun minimal configuration completed."
}


#----- MAIN FUNCTION -----#
function main {

    echo "" 
    echo "#-------------------------------------------#"
    echo "#         Bootstrap Install Script          #"
    echo "#-------------------------------------------#"

    packages
    reruninstall
    rerunconfig
    
    user=${SUDO_USER:-$(whoami)}
    echo "User is ${user}"
    echo ""
    echo "Bootstrap installation completed."
    echo ""
    echo "Be sure to run 'source /etc/profile.d/rerun.sh' for changes to take effect in current shell."
}

#----- END FUNCTIONS -----#


#----- PROCESS CLI OPTIONS -----#
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
	    exit
	    ;;
        --rerun-modules-dir)
	    RR_MODULES_DIR=$VALUE
	    ;;
	*)
	    echo "ERROR: unknown parameter \"$PARAM\""
	    usage
	    exit 1
	    ;;
    esac
    shift
done

#----- LET'S GET 'ER DONE! -----#

main
exit 0;
