#! /bin/bash

export DEEPDIVE_HOME="/lfs/madmax3/0/czhang/deepdive"
export PALEO_HOME="/lfs/madmax3/0/czhang/cleanpaleo"

export PYPY_GC_MAX=20GB
# Database Configuration
export DB_NAME=deepdive_large3
export DB_USER=czhang
#Password is set via the PGPASSWORD environment variable
export DB_PASSWORD=bB19871121
export DB_PORT=5431

cd $DEEPDIVE_HOME

#$PALEO_HOME/prepare_data.sh
env /lfs/madmax3/0/czhang/software/sbt/bin/sbt "run -c $PALEO_HOME/application.conf"
