#!/bin/sh

# copy sql dump if you need:
# scp dhis@lmisdev.dhis2.org:~/dhis2-lmis.sql ./

echo "Stopping Tomcat.."
./dhis2-server/bin/shutdown.sh
sleep 10
echo "Stopped Tomcat"

echo "Restoring database.."
psql -U postgres -c "drop database dhis2"
echo "Dropped database"
psql -U postgres -c "create database dhis2 with owner lmis encoding 'utf-8'"
echo "Created database"
psql -d dhis2 -U postgres -f dhis2-lmis.sql
echo "Restored database"

echo "Starting tomcat, system will be up in 60s.."
./dhis2-server/bin/startup.sh
