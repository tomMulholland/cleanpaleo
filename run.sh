#! /bin/bash

export DEEPDIVE_HOME=`cd $(dirname $0)/../..; pwd`
export PALEO_HOME="$DEEPDIVE_HOME/app/paleo"

# Database Configuration
export DB_NAME=deepdive_small2
export DB_USER=dennybritz
#Password is set via the PGPASSWORD environment variable
export DB_PASSWORD=
export DB_PORT=5432

cd $DEEPDIVE_HOME

$PALEO_HOME/prepare_data.sh
JAVA_OPTS="-Xmx4g" SBT_OPTS="-Xmx4g" sbt "run -c $PALEO_HOME/application.conf"
