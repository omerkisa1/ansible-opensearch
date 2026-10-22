resource "openstack_networking_secgroup_v2" "opensearch_sg" {
  name        = "opensearch-sg"
  description = "OpenSearch lab security group"
}

# SSH - yalnızca kendi erişim IP adresinden izin ver
resource "openstack_networking_secgroup_rule_v2" "ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.ssh_allowed_cidr
  security_group_id = openstack_networking_secgroup_v2.opensearch_sg.id
}

# OpenSearch REST API
resource "openstack_networking_secgroup_rule_v2" "opensearch_api" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9200
  port_range_max    = 9200
  remote_ip_prefix  = var.opensearch_network_cidr
  security_group_id = openstack_networking_secgroup_v2.opensearch_sg.id
}

# OpenSearch node transport
resource "openstack_networking_secgroup_rule_v2" "opensearch_transport" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9300
  port_range_max    = 9300
  remote_ip_prefix  = var.opensearch_network_cidr
  security_group_id = openstack_networking_secgroup_v2.opensearch_sg.id
}