* Get dhis.war into the current directory e.g. wget https://www.dhis2.org/download/releases/2.15/dhis.war
* vagrant up
* vagrant ssh
* cd /vagrant
* sudo ./setup
* ./start
* Access DHIS2 at http://localhost:8080/dhis2 (on both host and VM) with credentials: admin/district
* ./dumpdata (only when you need test dataset)

Reset Data
==========

In case you want to clear all data and dump in test data on a running instance:

* vagrant ssh
* cd /vagrant
* ./setup
* ./start
* ./dumpdata