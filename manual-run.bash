#!/bin/bash

echo "Manually running all tests..."

number_of_tests=`awk 'begin { tests=0 } /^  {/ { ++tests } END { print tests }' tis.config`

for N in `seq $number_of_tests`
do
  echo "=============[ Test $N ]============="

  cmd="\
tis-interpreter\
 --no-color\
 -tis-config-load tis.config\
 -tis-config-select $N\
 --keep-results\
 -info-json-results test-results-$N.json"

  echo "CMD:> $cmd"

  echo "-------------------------------------"

  $cmd

done
