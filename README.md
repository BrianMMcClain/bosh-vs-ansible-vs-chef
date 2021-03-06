Bosh, Chef, and Ansible Examples
===

[Infrastructure as Code is Not Enough: Comparing BOSH, Ansible, and Chef - Part 1](https://content.pivotal.io/blog/comparing-bosh-ansible-chef-part-1)

[Infrastructure as Code is Not Enough: Comparing BOSH, Ansible, and Chef - Part 2](https://content.pivotal.io/blog/comparing-bosh-ansible-chef-part-2)

The code provides an example for setting up a RabbitMQ cluster using three different automation/configuration management/infrastructure orchestration tools: BOSH, Chef, and Ansible. RabbitMQ was chosen because it supports a multi-server cluster and all three tools provide community-built releases for installing it.

This was tested using Google Cloud Platform, so some of the code is GCP-specific, but could be modified and applied to other cloud providers as well.

Instructions are provided for each tool in the README file in their respective directories.
