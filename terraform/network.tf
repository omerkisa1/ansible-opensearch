resource "openstack_networking_network_v2" "opensearch_network" {
  name = "opensearch-network"
}

resource "openstack_networking_subnet_v2" "opensearch_subnet" {
  name            = "opensearch-subnet"
  network_id      = openstack_networking_network_v2.opensearch_network.id
  cidr            = var.opensearch_network_cidr
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "1.1.1.1"]
}