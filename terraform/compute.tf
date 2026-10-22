resource "openstack_compute_instance_v2" "opensearch" {
  name            = "opensearch-lab-01"
  image_id        = var.ubuntu_image_id
  flavor_id       = var.medium_flavor_id
  key_pair        = openstack_compute_keypair_v2.opensearch.name
  security_groups = [openstack_networking_secgroup_v2.opensearch_sg.name]

  block_device {
    uuid                  = var.ubuntu_image_id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 20
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid = openstack_networking_network_v2.opensearch_network.id
  }

  depends_on = [
    openstack_networking_router_interface_v2.opensearch_router_link
  ]
}