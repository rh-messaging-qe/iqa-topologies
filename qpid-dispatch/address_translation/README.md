# Readme

## setup commands

``` bash
docker tag rhmessagingqe/qpid-dispatch:centos7 qdrouterd:latest
ansible-playbook main.yml -i docker_inventory
```

## test commands

``` bash
ansible-playbook tests/send_receive.yml -i docker_inventory --verbose
```

## Get Broker IP

``` bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' Broker.A
```