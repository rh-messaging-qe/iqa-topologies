
.PHONY: clean
clean:
	docker rm Router.A Router.B Router.C Broker.A Client.B.cli-java Client.A.cli-java Client.B.cli-proton-python Client.A.cli-proton-python Client.B.cli-rhea Client.A.cli-rhea --force | true

.PHONY: setup
setup: clean
	ansible-playbook -i docker_inventory main.yml 

test-broker: setup
	ansible-playbook tests/send_receive_broker.yml -i docker_inventory --verbose

test-broker-2t: setup
	ansible-playbook tests/send_receive_broker.yml -i docker_inventory --verbose
	ansible-playbook tests/send_receive_broker.yml -i docker_inventory --verbose

test-linkroute: setup
	ansible-playbook tests/send_receive_linkroute.yml -i docker_inventory --verbose

test-linkroute-2t: setup
	ansible-playbook tests/send_receive_linkroute.yml -i docker_inventory --verbose
	ansible-playbook tests/send_receive_linkroute.yml -i docker_inventory --verbose

test-addr-prefix: setup
	ansible-playbook tests/send_receive_addr_prefix.yml -i docker_inventory --verbose

test-addr-prefix-2t: setup
	ansible-playbook tests/send_receive_addr_prefix.yml -i docker_inventory --verbose
	ansible-playbook tests/send_receive_addr_prefix.yml -i docker_inventory --verbose
