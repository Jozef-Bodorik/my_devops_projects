output "private_key_pem" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}