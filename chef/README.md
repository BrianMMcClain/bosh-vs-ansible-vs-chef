Chef
===

Setup
---
Setup [Chef Server](https://docs.chef.io/install_server.html#standalone) along with the Chef DK (client) on your workstation machine. A good walkthrough of this process can be followed [here](https://learn.chef.io/modules/manage-a-node-chef-server#/)).

Prepare Environment
---

#### Upload RabbitMQ Cookbook

_Using `berks`:_

From the directory containing the `Berksfile` run:

    berks install
    berks upload

_Using `knife`_:

The following command will require a local `git` repo to install to:

    knife cookbook site install rabbitmq

Alternatively, you can download the RabbitMQ cookbook, but you may need to download all the dependencies as well:

    knife cookbook site download rabbitmq
    tar xvzf rabbitmq-5.3.1.tar.gz
    knife cookbook upload rabbitmq --include-dependencies

#### Create Servers

While there _are_ some [`knife` plugins for the various cloud providers](https://docs.chef.io/plugin_knife.html) that all you to create infrastructure, bootstrap and define a node’s role in a single command, we've opted here to leave the infrastructure provisioning up to the user. Use the IaaS provider's UI portal, CLI tool, or API to provision the server(s).

Once the servers are up, you can use their IPs in the next (deploy) step to bootstrap and define the node's role.

Deploy
---

The following commands will deploy RabbitMQ to the Chef-managed nodes where `mychef1` refers to the name you are assigning the node.

_Bootstrap and assign the RabbitMQ role to each server:_

    knife bootstrap <MACHINE_IP> -N mychef1 -x <SSH_USER> -i <PATH_TO_SSH_KEY> --sudo --node-ssl-verify-mode none -r 'rabbitmq::default'


_Assign management role to server(s):_

    knife node run_list add mychef1 'rabbitmq::mgmt_console'

_Run the chef-client:_

    knife ssh name:mychef -x <SSH_USER> -i <PATH_TO_SSH_KEY> "sudo chef-client"
