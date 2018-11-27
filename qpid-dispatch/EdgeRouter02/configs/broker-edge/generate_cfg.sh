#!/bin/bash

amqcfg -t artemis/2.6.0 -p artemis/2.6.0/ha/replication.yaml --tune tuning.slave -o slave/
amqcfg -t artemis/2.6.0 -p artemis/2.6.0/ha/replication.yaml --tune tuning.master -o master/

for instance in master slave; do
    sed -i -e '/<\/addresses>/r broker_addresses.xml' -e 's/<\/addresses>//g' ${instance}/broker.xml
done
