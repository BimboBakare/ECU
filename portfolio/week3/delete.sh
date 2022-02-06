#!/bin/bash


echo $1
echo $2


if [ "$#" -ne 2 ]; then
    # did not get exactly two arguments
    printf 'Usage:\n\t%s file1 file2\n' "$0" >&2
    exit 1
elif [ ! -f "$1" ] || [ ! -f "$2" ]; then
    echo 'One of the files does not exist (or is not a regular file)' >&2
    exit 1
elif [ "$1" -ef "$2" ]; then
    printf '%s and %s refer to the same file\n' "$1" "$2" >&2
    exit 1
fi
