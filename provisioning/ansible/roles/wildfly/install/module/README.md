### Wildfly modules

This directory contains playbooks that install custom Wildfly modules. These are 
modules that will be installed under $JBOSS_HOME/modules.  Pay close attention to 
the module's version information.  Chances are good you'll need to reference this 
information in the standalone.xml. 

By convention:

* Each module has the wildfly/install module as a dependency.
* A module's binaries must be manually downloaded into roles/wildfly/install/module/"module name"/files/ 
* Only one version of a module can be installed.  For example, only one postgresql jdbc driver can be installed at $JBOSS_HOME/modules/org/postgresql.
