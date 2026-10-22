output "private_ip" {
  value = openstack_compute_instance_v2.opensearch.access_ip_v4
}