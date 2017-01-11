#!/bin/bash
set -e

if [ -e stats.csv ]; then
  rm stats.csv
fi

run-command-on-git-revisions $1 $2 "sh perf_stats_on_this_rev.sh >> stats.csv"


