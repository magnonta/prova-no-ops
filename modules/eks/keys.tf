# generate keys
resource "tls_private_key" "keygen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# export key pair
resource "aws_key_pair" "key_pair" {
  key_name   = "${var.cluster_name}-key-pair"
  public_key = tls_private_key.keygen.public_key_openssh
}

resource "local_file" "file" {
  content  = tls_private_key.keygen.private_key_pem
  filename = "${path.module}/../../keys/${var.local_file_name}"
}
