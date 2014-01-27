#! /bin/bash

cd "$(dirname $0)/../deepdive";
ROOT_PATH=`pwd`

$ROOT_PATH/../cleanpaleo/prepare_data.sh
env /lfs/madmax3/0/czhang/software/sbt/bin/sbt "run -c $ROOT_PATH/../cleanpaleo/application.conf"
