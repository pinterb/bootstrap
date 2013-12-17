#!/usr/bin/env bash

###########################################################
#
# Create a new skeleton directory structure for a new role.
#
###########################################################

MY_SCRIPT_DIR=`echo "$( cd "${BASH_SOURCE[0]%/*}" && pwd )"`
MY_SCRIPT_FILENAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
ME=$MY_SCRIPT_DIR/$MY_SCRIPT_FILENAME

ROLE_DIR=`pwd`
ROLE_NAME=samplerole

function usage()
{
    echo ""
    echo "This script creates an Ansible role directory structure that follows some best practices"
    echo ""
    echo "$ME"
    echo "    -h --help"
    echo "    --role-path=$ROLE_DIR"
    echo "    --name=$ROLE_NAME"
    echo ""
}
 
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --role-path)
            ROLE_DIR=$VALUE
            ;;
        --name)
            ROLE_NAME=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

# Make sure the role's path indeed exists 
if [ ! -d $ROLE_DIR ]; then
    mkdir -p $ROLE_DIR
fi

ROLE_LOCATION=$ROLE_DIR/$ROLE_NAME
# But also make sure role name directory does not exist (ie don't overwrite) 
if [ -d $ROLE_LOCATION ]; then
    echo "Error!  $ROLE_LOCATION already exists!!"
    echo "Move or rename this directory OR choose another role name."
    exit 1
fi

# Create baseline directories
mkdir -p $ROLE_LOCATION/defaults
mkdir -p $ROLE_LOCATION/files
mkdir -p $ROLE_LOCATION/handlers
mkdir -p $ROLE_LOCATION/meta
mkdir -p $ROLE_LOCATION/tasks
mkdir -p $ROLE_LOCATION/templates
mkdir -p $ROLE_LOCATION/vars

###
#  Every role probably should have some default variables. 
###
cat << DEFAULT-README > $ROLE_LOCATION/defaults/README.md 
The role's default variable values should go in the main.yml file.
Please keep in mind that these are only defaults (hence the directory name).
This means the role will bring along a default value but ANYTHING in Ansible 
will override it.

Please refer to the Ansible documentation at:
http://www.ansibleworks.com/docs/playbooks_variables.html 
DEFAULT-README

cat << DEFAULTS > $ROLE_LOCATION/defaults/main.yml
---
# file: $ROLE_DIR/$ROLE_NAME/defaults/main.yml
DEFAULTS

###
#  A role's variables. 
###
cat << VARS > $ROLE_LOCATION/vars/main.yml
---
# file: $ROLE_DIR/$ROLE_NAME/vars/main.yml
VARS

###
#  A role's tasks.
###
cat << TASKS > $ROLE_LOCATION/tasks/main.yml
---
# file: $ROLE_DIR/$ROLE_NAME/tasks/main.yml
TASKS

###
#  A role's task handlers.
###
cat << HANDLERS > $ROLE_LOCATION/handlers/main.yml
---
# file: $ROLE_DIR/$ROLE_NAME/handlers/main.yml
HANDLERS

###
#  A role may be dependent on the existence of another role. 
###
cat << META-README > $ROLE_LOCATION/meta/README.md
Role dependencies allow you to automatically pull in other roles when using a role. 
Role dependencies are stored in the main.yml file contained within this directory. 
This file should contain a list of roles and parameters to insert before this role.

Please refer to the Ansible documentation at:
http://www.ansibleworks.com/docs/playbooks_variables.html 
META-README

cat << META > $ROLE_LOCATION/meta/main.yml
---
# file: $ROLE_DIR/$ROLE_NAME/meta/main.yml
META
