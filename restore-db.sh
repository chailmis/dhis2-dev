#!/bin/sh

# copy sql dump if you need:
# scp dhis@lmisdev.dhis2.org:~/dhis2-lmis.sql ./

echo "Stopping Tomcat.."
./dhis2-server/bin/shutdown.sh
sleep 10
echo "Stopped Tomcat"

echo "Create lmis db user if not exist"
sudo -u postgres psql -c "create user lmis"
echo "Restoring database.."
sudo -u postgres psql -c "drop database dhis2"
echo "Dropped database"
sudo -u postgres psql -c "create database dhis2 with owner lmis encoding 'utf-8'"
echo "Created database"
sudo -u postgres psql -d dhis2 -f dhis2-lmis.sql
echo "Restored database"

echo "Starting tomcat, system will be up in 60s.."
./start
