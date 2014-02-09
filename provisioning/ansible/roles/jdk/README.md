# jdk 

This role installs Oracle's JDK. It replaces this [role](https://github.com/pinterb/ansible-roles/tree/master/java). 
 
## role variables

|name|description|default|
|----|-----------|-------|
|`jdk.version`|version to be installed|1.7.0_51|
|`jdk.installdir`|installation directory|/usr/local/java|
|`jdk.download.url`|url to Oracle's binary|http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz|
|`jdk.download.filename`|name of file to be installed|jdk-7u51-linux-x64.tar.gz|

## role dependencies

N/A
