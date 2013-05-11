#!/usr/bin/env bash
# This bootstraps Java on CentOS 6.x
# It has been tested on CentOS 6.4 64bit

set -e

JRE_VERSION=jre1.7.0_21
REPO_URL="http://javadl.sun.com/webapps/download/AutoDL?BundleId=76853"
TAR_GZ_NAME=java.tar.gz

DOWNLOAD_DIR=/tmp
INSTALL_DIR=/usr/local/java

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which java > /dev/null 2>&1; then
  echo "Java is already installed."
  REAL_VERSION=`java -version`
  echo ${REAL_VERSION}
  exit 0
fi

# Retrieve Oracle JRE 
echo "Retrieving Oracle Java JRE..."
wget --no-cookies ${REPO_URL} -O ${DOWNLOAD_DIR}/${TAR_GZ_NAME} 

# Install Oracle JRE 
echo "Installing Oracle Java JRE..."
if [ ! -d "${INSTALL_DIR}" ]; then
    echo "${INSTALL_DIR} does not exist." >&2;
    mkdir -p ${INSTALL_DIR}
fi

cd ${INSTALL_DIR}
tar zxvf ${DOWNLOAD_DIR}/${TAR_GZ_NAME}

# Update PATH 
echo "Update PATH (i.e. /etc/profile.d/)"
cat > /etc/profile.d/java.sh << EOF
#!/bin/sh
export JAVA_HOME=${INSTALL_DIR}/${JRE_VERSION}
export JRE_HOME=${INSTALL_DIR}/${JRE_VERSION}
export PATH=${INSTALL_DIR}/${JRE_VERSION}/bin:$PATH
EOF

# Export JAVA_HOME 
export JAVA_HOME=${INSTALL_DIR}/${JRE_VERSION}
export JRE_HOME=${INSTALL_DIR}/${JRE_VERSION}
export PATH=${INSTALL_DIR}/${JRE_VERSION}/bin:$PATH

REAL_VERSION=`java -version`

echo "Java installed!"
echo ${REAL_VERSION}
