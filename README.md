# Habitat package: consul-client

## Description

This package provides packaging and configuration for running Consul in "Client" or "Agent" mode.  This is designed to connect to an existing consul cluster.

## Justification

Consul is one binary that can be run in either Server or Client mode based on command line parameters at start.  However, when discussing Consul, you would say "Consul Client" or or "Consul Server", thus it makes sense to separate out the two plans into their own packages.

## Usage

run it yo!

Desired usage would be:

   # on the hab server(s) (where 999.999.999.999 is repleaced with a real peer IP)
   hab svc start core/consul --topology leader --group default --peer 999.999.999.999

   # on the client node:
   hab svc start --bind consul-server:consul.default


