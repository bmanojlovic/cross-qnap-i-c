#!/bin/bash -e
COMMAND=$1
shift
(cd /tmp/src ; $COMMAND $@)
