Ansible
===

Setup
---
**Prerequisites:**

1. Install Ansible 2.4+ (`sudo pip install ansible`)
2. Install apache-libcloud (`sudo pip install apache-libcloud`)
3. Install PyCrypto (`sudo pip install pycrypto`)
4. Install RabbitMQ role from Ansible Galaxy (`ansible-galaxy install jasonroyle.rabbitmq`)

Prepare Playbook
---
The playbook leverages the [GCE Module](http://docs.ansible.com/ansible/latest/gce_module.html) to provision infrastructure to GCP. The `gce.yml` file defines the necessary parameters required to connect to GCP. You will need to update this file in the `vars` section to include information for connecting to your specific GCP project. (Also, make sure project_id is all lowercase.)

To use a different IaaS provider, replace the `gce.yml` file with a playbook utilizing one of the [other Ansible cloud modules](http://docs.ansible.com/ansible/latest/list_of_cloud_modules.html). Be sure to update `site.yml` to point to the correct IaaS provisioning playbook.

Deploy
---

The following command will deploy RabbitMQ using Ansible on GCP infrastructure. (The required variable(s) to provide may differ for other cloud providers.)

    ansible-playbook site.yml --extra-vars "ansible_ssh_private_key_file=<PATH_TO_SSH_PRIVATE_KEY_FOR_GCP>"
