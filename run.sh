#! /bin/bash

cd "$(dirname $0)/../deepdive";
ROOT_PATH=`pwd`

$ROOT_PATH/../cleanpaleo/prepare_data.sh
JAVA_OPTS="-Xmx4g" SBT_OPTS="-Xmx4g" sbt "run -c $ROOT_PATH/../cleanpaleo/application.conf"
