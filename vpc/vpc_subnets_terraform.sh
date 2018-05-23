#!/usr/bin/env bash


CWD=$(dirname $0)

RESULT=`python $CWD/vpc_subnets_terraform.py $1 $2`
echo $RESULT

