#!/bin/sh
export JAVA_HOME={{java_install_dir_Debian_x86_64}}/jdk{{jvm_version}}
export JRE_HOME={{java_install_dir_Debian_x86_64}}/jre{{jvm_version}}
export J2RE_HOME={{java_install_dir_Debian_x86_64}}/jre{{jvm_version}}
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
