# Readme

Deploy testing topology with one broker with custom network under docker environment.

## setup commands

It's required to run these command before executing Ansible:

### Select image which will be used:

``` bash
docker pull rhmessagingqe/qpid-dispatch:ubuntu1804
docker tag rhmessagingqe/qpid-dispatch:ubuntu1804 qdrouterd:latest
```

### Deploy clean topology

This command only setup the topology under docker environment without running any special commands following by clients for example.

``` bash
make setup
```

## Basic "test" playbooks

Deploy topology is not needed, because it's already included in makefile.

Execution "test playbooks" with make without using Ansible commands.

```  bash
make test-broker test-broker-2t test-linkroute test-linkroute-2t test-addr-prefix test-addr-prefix-2t
```

## Examples

### Get Broker IP

``` bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' Broker.A
```

### Get Router.B logs

``` bash
docker logs Router.B
```