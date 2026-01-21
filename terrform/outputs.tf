output "subnet_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "ID do Security Group criado na AWS"
  value       = aws_security_group.security_group.id

}


output "ansible_controller_ip" {
  description = "IP Publico da maquina que vai rodar o Ansible"
  value       = aws_instance.ansible_controller.public_ip
}

output "jenkins_master_ip" {
  description = "Acesse o Jenkins em: http://<IP>:8080"
  value       = aws_instance.jenkins_master.public_ip
}

output "jenkins_agent_ip" {
  description = "IP do Slave/Build Node"
  value       = aws_instance.jenkins_agent.public_ip
}