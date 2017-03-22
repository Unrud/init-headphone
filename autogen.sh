#!/bin/sh
AUTORECONF="$(which autoreconf)"
if test -z "$AUTORECONF"
then
	echo "*** Error: autoreconf not found"
	exit 1
fi
"$AUTORECONF" --force --install --verbose || exit $?
