#!/bin/bash

DIR=$(cd $(dirname "$0"); pwd)
BIN=$DIR"/../../bin"
ETC=$DIR"/../../etc"
DEBUG_PATH="/tmp/arbiter_spare.debug"

# needed because arbiter doesn't have a default 'workdir' "properties" attribute:
cd "$DIR/../../var"
echo "Launching Arbiter (that read configuration and dispatch it) in debug mode to the file $DEBUG_PATH"
$BIN/shinken-arbiter -d -c $ETC/nagios.cfg -c $ETC/../test/etc/test_stack2/nagios-spare.cfg  -c $ETC/../test/etc/test_stack2/shinken-specific-ha-only.cfg --debug $DEBUG_PATH --name Arbiter-spare
