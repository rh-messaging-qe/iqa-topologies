# Qpid Dispatch - Edge based topology 02

## Description

## Graph

![3 edge routers connected to 3 internal routers which communicate in one network with connected failover Broker.](graph.png "Topology graph")

## Elements

### Brokers

Failover

- Broker.A
- Broker.B

### Clients

- Client.E1 (edge)
- Client.E2 (edge)
- Client.E3 (edge)

### Routers

#### Router.I1 (interior)

Listeners:

- 5672 open for managements
- 5656 open for inter-router
- 5678 open for edges (SASL Anonymous)

#### Router.I2 (interior)

Listeners

- 5672 open for managements
- 5656 open for inter-router
- 5678 open for edges  (SASL Auth. required)

Connectors

- To Router.I1:5656 inter-router

#### Router.I3 (interior)

Listeners

- 5672 open for managements
- 5656 open for inter-router
- 5678 open for edges (TLS Aut. required)

Connectors

- To Router.I2:5656 inter-router

#### Router.E1 (edge)

Listeners

- 5672 open for managements
- 5677 open for clients (SASL Anonymous)

Connectors

- To Router.I1 5678:edge

#### Router.E2 (edge)

Listeners

- 5672 open for managements
- 5677 open for clients (SASL Auth. required)

Connectors

- To Router.I2:5678 edge

#### Router.E3 (edge)

Listeners

- 5672 open for managements
- 5677 open for clients (TLS Aut. required)

Connectors

- To Router.I3:5678 edge

## Deployment

Docker playbook:

```bash
ansible-playbook -i inventory.yml deploy_docker.yml
```