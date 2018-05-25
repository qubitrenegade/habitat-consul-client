# Habitat package: consul-client

## Description

This package provides packaging and configuration for running Consul in "Client" or "Agent" mode.  This is designed to connect to an existing consul cluster.

## Justification

Consul is one binary that can be run in either Server or Client mode based on command line parameters at start.  However, when discussing Consul, you would say "Consul Client" or or "Consul Server", thus it makes sense to separate out the two plans into their own packages.

## Usage

run it yo!

Desired usage would be:

```
# on the hab server(s) (where 999.999.999.999 is repleaced with a real peer IP)
hab svc start core/consul --topology leader --group default --peer 999.999.999.999

# on the client node:
hab svc start --bind consul-server:consul.default
```

## Example Usage

Generally, running all three Consul servers on one host is contraindicated.  However, for development or example purposes this will work perfectly fine:

```
# If you haven't already export core/consul to a docker container
hab studio enter  # This is required on a Mac and probably Windows, this can be skipped in linux
hab pkg export docker core/consul

# Start your consul cluster:
##  Terminal 1
docker run -p8500:8500 -e HAB_CONSUL='{ "server": { "bind": "0.0.0.0" }, "client": { "bind": "0.0.0.0" }}' core/consul --topology leader

## Terminal 2 & 3+
docker run -e HAB_CONSUL='{ "server": { "bind": "0.0.0.0" }}' core/consul --peer 172.17.0.2 --topology leader

# Export the qubitrenegade/consul-client to docker container: (this can also be pulled from docker hub)
hab studio enter
hab pkg export docker qubitrenegade/consul-client

# Start your consul-client:
docker run -it qubitrenegade/consul-client --peer 172.17.0.2 --bind consul-server:consul.default
```
