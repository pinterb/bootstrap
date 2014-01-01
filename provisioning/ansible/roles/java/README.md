# java 

This role installs Oracle's JDK. By convention, you must manually download the binary from Oracle's website.

See [files](https://github.com/pinterb/bootstrap/tree/master/provisioning/ansible/roles/java/files).

## role variables

|name|description|default|
|----|-----------|-------|
|`java.version`|version to be installed|1.7.0_45|
|`java.installdir`|installation directory|/usr/local/java|
|`java.archive.jdk`|binary file to be installed (from [files](https://github.com/pinterb/bootstrap/tree/master/provisioning/ansible/roles/java/files))|jdk-7u45-linux-x64.tar.gz|

## role dependencies

N/A
