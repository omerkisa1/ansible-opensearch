data "openstack_networking_network_v2" "public_network" {
  network_id = var.external_network_id
}

resource "openstack_networking_floatingip_v2" "opensearch_floatingip" {
  pool = data.openstack_networking_network_v2.public_network.name
}

resource "openstack_compute_floatingip_associate_v2" "opensearch_floatingip_attach" {
  floating_ip = openstack_networking_floatingip_v2.opensearch_floatingip.address
  instance_id = openstack_compute_instance_v2.opensearch.id
}

output "opensearch_public_ip" {
  value = openstack_networking_floatingip_v2.opensearch_floatingip.address
}