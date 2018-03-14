#!/bin/bash

# Update HOST with actual value as this is generated on startup each time
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" $ORACLE_HOME/network/admin/listener.ora
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" $ORACLE_HOME/network/admin/tnsnames.ora

while true; do
    pmon=`ps -ef | grep pmon_$ORACLE_SID | grep -v grep`

    if [ "$pmon" == "" ]
    then
        date
        /etc/init.d/oracle-xe start
        echo "Database ready to use. Enjoy!"

		# create schemas if specified (create poi schemas always)
		if [ "$SCHEMAS" == "" ]; then
			SCHEMAS="poi";
		else
		    SCHEMAS+=" poi";
		fi

		if [ "$SCHEMAS" == "" ]; then
			echo "If you want to create some database schemas automatically specify SCHEMAS environment variable";
		else
			for db in ${SCHEMAS} ; do
				if [ -f "/db.${db}" ];
				then
					echo "User ${db} already exists"
				else
					echo "Is about to create schema: $db"
					cp /u01/app/oracle/product/11.2.0/xe/config/scripts/template.schema.sql  \
					    /u01/app/oracle/product/11.2.0/xe/config/scripts/$db.schema.sql
					sed -i -E "s/TEMPLATE_USER/$db/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/$db.schema.sql
					sqlplus -S system/oracle@localhost @/u01/app/oracle/product/11.2.0/xe/config/scripts/$db.schema.sql
					touch "/db.${db}"
					echo "Schema $db was successfully created"
				fi
			done
		fi

		#create poi_assist
		echo "Init POI db-scripts..."
		sqlplus -S poi/poi@localhost @/u01/app/oracle/product/11.2.0/xe/config/scripts/poi.assist.package.sql

		# run the database init scripts
		for f in ${DEPLOYMENT_DIR}/*; do
              case "$f" in
                *.sh)     echo "$0: running $f"; . "$f" ;;
                *.sql)    echo "$0: running $f"; echo "exit" | sqlplus "SYS/oracle" AS SYSDBA @"$f"; echo ;;
                *)        echo "$0: ignoring $f" ;;
              esac
              echo
        done
    fi
    sleep 1m
done;
