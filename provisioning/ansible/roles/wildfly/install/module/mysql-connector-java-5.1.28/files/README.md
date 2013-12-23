There are programmatic solutions out there for accepting Oracle's licensing agreement during a scripted download.
Most of them seem hackish and quite brittle.  So rather than deal with all that licensing mumbo jumbo in a script,
by convention this [Ansible](http://www.ansibleworks.com/) role looks to this directory for this JBoss module's
binaries.

Copy your downloaded jar to this directory.  Be sure to update this role's vars/main.yml with
the correct version.

For downloading binaries, go to Oracle's [website](http://dev.mysql.com/downloads/connector/j/).
