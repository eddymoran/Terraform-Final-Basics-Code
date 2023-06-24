#Configure =output
output "public_ip" {
  value       = aws_instance.week20.public_ip
  description = "Public IP address of the Jenkins server"
}