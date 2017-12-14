Chef
===

Setup
---
Setup [Chef Server](https://docs.chef.io/install_server.html#standalone) along with the Chef DK (client) on your workstation machine. A good walkthrough of this process can be followed [here](https://learn.chef.io/modules/manage-a-node-chef-server#/).

For installing on GCP, the [knife-google](https://github.com/chef/knife-google) plugin is also required. Install it by running `chef gem install knife-google`.

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
    
Deploy
---

The following commands will deploy RabbitMQ to the Chef-managed nodes where `mychef1` refers to the name you are assigning the node:

_Create role for RabbitMQ cluster:_

    knife role from file rabbit_cluster.rb

_Create the Server and assign RabbitMQ role:_

    knife google server create mychef1 -Z us-east1-b -m n1-standard-1 --gce-project <PROJECT_NAME> -I ubuntu-1604-xenial-v20171028 --node-ssl-verify-mode none --no-node-verify-api-cert -x <SSH_USER> -i <PATH_TO_SSH_KEY> -r 'role[rabbit_cluster]' -T rmq

Alternatively, if you have infrastructure that already exists, you may choose to assign the role to each server and run individually:

_Bootstrap and assign the RabbitMQ role to each server:_

    knife bootstrap <MACHINE_IP> -N mychef1 -x <SSH_USER> -i <PATH_TO_SSH_KEY> --sudo --node-ssl-verify-mode none -r 'role[rabbit_cluster]'

_Run the chef-client:_

    knife ssh name:mychef -x <SSH_USER> -i <PATH_TO_SSH_KEY> "sudo chef-client"
