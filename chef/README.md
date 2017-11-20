Chef
===

Setup
---
Setup [Chef Server](https://docs.chef.io/install_server.html#standalone) (alternative walkthrough [here](https://learn.chef.io/modules/manage-a-node-chef-server#/))

Download RabbitMQ Cookbook

```
knife cookbook site install rabbitmq
knife cookbook site download rabbitmq
knife cookbook upload rabbitmq --include-dependencies
```

Create the machine in GCP

Bootstrap and assign the RabbitMQ role
```
knife bootstrap <MACHINE IP> -N mychef -x <SSH USER> -i <PATH TO SSH KEY> --sudo --node-ssl-verify-mode none -r 'rabbitmq::default'
```

Assign management role to machine
```
knife node run_list add mychef 'rabbitmq::plugin_management'
```

And rerun the chef-client
```
knife ssh name:chef1 -x brian -i ~/.ssh/id_rsa "sudo chef-client"
```
