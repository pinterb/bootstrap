# wildfly 

This role manages a standalone instance of JBoss's Wildfly application server.

## usage

This role supports a couple of different opertions:

*wildfly/install* - Basic install.  Configured same as out-of-box download from JBoss.

*wildfly/module/mysql-connector-java-5.1.18* - Basic install w/mysql jdbc driver module. 

*wildfly/module/postgresql-9.3-1100* - Basic install w/postgresql jdbc driver module. 
 
*wildfly/uninstall* - As the name implies...uninstall Wildfly. 

## role variables

There are MANY variables to this role. 

**Note:** Using the default values in [defaults/main.yml](https://github.com/pinterb/bootstrap/blob/master/provisioning/ansible/roles/wildfly/install/defaults/main.yml) should result in an installation that closely resembles out-of-box install.

### installation:

|name|description|default|
|----|-----------|-------|
|`wildfly_version`|version to be installed|8.0.0.Beta1|
|`wildfly_install_dir`|installation directory|/opt|
|`jboss_user`|the linux user owning this wildfly install|jbossas|
|`jboss_groups`|the collection of linux groups owning this wildfly install|jbossas|


### wildfly.conf:

|name|description|default|
|----|-----------|-------|
|`wildfly_conf_dir`|installation directory for wildfly.conf|/etc/default|


### standalone.xml:

|name|description|default|
|----|-----------|-------|
|`wildfly_mgmt_bind_address`|listening address of admin|127.0.0.1|
|`wildfly_public_bind_address`|listening address|127.0.0.1|
|`wildfly_mgmt_native_port`|admin native port|9999|
|`wildfly_mgmt_http_port`|admin http port|9990|
|`wildfly_mgmt_https_port`|admin https port|9993|
|`wildfly_ajp_port`|ajp port|8009|
|`wildfly_http_port`|http port|8080|
|`wildfly_https_port`|https port|8443|
|`wildfly_datasources`|jdbc data sources|'ExampleDS' you get with the out-of-box install of Wildfly|
|`wildfly_jdbc_drivers`|jdbc drivers|h2 driver you get with the out-of-box install of Wildfly|


### standalone.conf:

|name|description|default|
|----|-----------|-------|
|`wildfly_memory_min`|min heap size|512m|
|`wildfly_memory_max`|max heap size|2048m|
|`wildfly_max_perm_size`|permanent space allocation|512m|
|`wildfly_java_opts`|collection of java command line options|user.timezone=GMT|


**Note:** Using the default values in [defaults/main.yml](https://github.com/pinterb/bootstrap/tree/master/provisioning/ansible/roles/wildfly/install/defaults/main.yaml) should result in an installation that closely resembles out-of-box install.

## role dependencies

  * [java](https://github.com/pinterb/bootstrap/tree/master/provisioning/ansible/roles/java)
