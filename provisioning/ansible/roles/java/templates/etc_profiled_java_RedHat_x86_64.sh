#!/bin/sh
export JAVA_HOME={{java_install_dir_RedHat_x86_64}}/latest
export JRE_HOME={{java_install_dir_RedHat_x86_64}}/latest/jre
export J2RE_HOME={{java_install_dir_RedHat_x86_64}}/latest/jre
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH