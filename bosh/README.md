BOSH
===

Setup
---

A BOSH director will be required to deploy via BOSH. Please refer to the documentation on how to set this up for your infrastructure [here](http://bosh.io/docs/init.html).

Alternativly, [BBL](https://github.com/cloudfoundry/bosh-bootloader) will handle much of the setup as well automatically

Additionally, the BOSH CLI is required on your local machine, which can be found [here](http://bosh.io/docs/cli-v2.html#install).

BOSH Lite
---


Prep BOSH
---

Before we can deploy RabbitMQ, we must provide BOSH with the stemcell, the golden image that all the pacakages will be compiled against and deployed on. For this example, we'll deploy on Ubuntu. More information on stemcells can be found [here](http://bosh.io/docs/stemcell.html)

AWS
`bosh -e bosh-1 upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/aws/bosh-stemcell-3468.1-aws-xen-hvm-ubuntu-trusty-go_agent.tgz`

GCP
`bosh -e bosh-1 upload-stemcell https://bosh.io/d/stemcells/bosh-google-kvm-ubuntu-trusty-go_agent?v=3468.1`

vSphere
`bosh -e bosh-1 upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/vsphere/bosh-stemcell-3468.1-vsphere-esxi-ubuntu-trusty-go_agent.tgz`

Deploy
---

`bosh -e bosh-1 -d cf-rabbitmq deploy rabbit.yml`
