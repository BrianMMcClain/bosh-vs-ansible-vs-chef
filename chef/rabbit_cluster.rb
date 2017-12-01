name "rabbit_cluster"
description "RabbitMQ Cluster"
run_list "recipe[rabbitmq::default]", "recipe[rabbitmq::mgmt_console]", "recipe[rabbitmq::plugin_management]", "recipe[rabbitmq::cluster]"