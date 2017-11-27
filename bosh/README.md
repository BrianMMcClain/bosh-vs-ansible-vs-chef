BOSH
===

Setup
---

A BOSH director will be required to deploy via BOSH. We recommend using [BOSH Bootloader (bbl)](https://github.com/cloudfoundry/bosh-bootloader) to get this set up. The BOSH CLI is also required on your local machine, which can be found [here](http://bosh.io/docs/cli-v2.html#install).

_Example on GCP:_

    bbl up --gcp-region us-east1 --gcp-service-account-key <KEYFILE_JSON> --iaas gcp
    bosh alias-env bosh-1 -e 10.0.0.6

Alternatively, [BOSH Lite](https://bosh.io/docs/bosh-lite) can be used to set up an environment on your local machine.

Prepare Environment
---
#### Set Director UUID

In the `rabbit.yml` file, make sure to update the `director_uuid` parameter to match the UUID of the Director that was set up in the first step above. You can find out the UUID by running the `bosh env` command.

#### Upload Stemcell

Before we can deploy RabbitMQ, we must provide BOSH with the stemcell, the golden image that all the packages will be compiled against and deployed on. For this example, we'll deploy on Ubuntu. More information on stemcells can be found [here](http://bosh.io/docs/stemcell.html).

**AWS**

    bosh -e bosh-1 upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/aws/bosh-stemcell-3468.1-aws-xen-hvm-ubuntu-trusty-go_agent.tgz

**GCP**

    bosh -e bosh-1 upload-stemcell https://bosh.io/d/stemcells/bosh-google-kvm-ubuntu-trusty-go_agent?v=3468.1

**vSphere**

    bosh -e bosh-1 upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/vsphere/bosh-stemcell-3468.1-vsphere-esxi-ubuntu-trusty-go_agent.tgz

Deploy
---

The following command will deploy RabbitMQ using BOSH where `bosh-1` refers to the BOSH Director environment alias.

    bosh -e bosh-1 -d cf-rabbitmq deploy rabbit.yml
