resource "tls_private_key" "opensearch" {
  algorithm = "ED25519"
}

resource "openstack_compute_keypair_v2" "opensearch" {
  name       = "opensearch-key"
  public_key = tls_private_key.opensearch.public_key_openssh
}

resource "local_sensitive_file" "opensearch_private_key" {
  filename        = pathexpand("~/Desktop/pem_files/opensearch-key")
  content         = tls_private_key.opensearch.private_key_openssh
  file_permission = "0600"
}

resource "local_file" "opensearch_public_key" {
  filename        = pathexpand("~/Desktop/pem_files/opensearch-key.pub")
  content         = tls_private_key.opensearch.public_key_openssh
  file_permission = "0644"
}