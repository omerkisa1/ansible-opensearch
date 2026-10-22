resource "openstack_networking_router_v2" "opensearch_router" {
  name                = "opensearch-router"
  admin_state_up      = true
  external_network_id = var.external_network_id
}

resource "openstack_networking_router_interface_v2" "opensearch_router_link" {
  router_id = openstack_networking_router_v2.opensearch_router.id
  subnet_id = openstack_networking_subnet_v2.opensearch_subnet.id
}