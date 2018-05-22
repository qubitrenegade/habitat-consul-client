#!/bin/bash -xe

exec 2>&1

consul agent \
  {{#eachAlive bind.consul-server.members as |member|}}
    -retry-join {{member.sys.ip}} \
  {{~/eachAlive}}
  -config-file={{pkg.svc_config_path}}/agent.json
  
