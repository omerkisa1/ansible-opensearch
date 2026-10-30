output "private_ip" {
  value = openstack_compute_instance_v2.opensearch.access_ip_v4
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<-EOT
    [opensearch]

    opensearch-vm ansible_host=${openstack_networking_floatingip_v2.opensearch_floatingip.address} ansible_user=ubuntu ansible_ssh_private_key_file=/Users/omerkisa/Desktop/pem_files/opensearch-key

    # just to ignore warning about python
    [all:vars]
    ansible_python_interpreter=/usr/bin/python3.12
  EOT
}
