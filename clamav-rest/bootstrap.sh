#!/bin/bash
set -m

echo "using clamd server: $host:$port"

# start in background
java -jar /var/clamav-rest/clamav-rest-1.0.0.jar --clamd.host=$host_clamav_server --clamd.port=$port_clamav_server

