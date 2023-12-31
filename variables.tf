#Configure AMI variable
variable "ami_id" {
  type        = string
  description = "AMI ID"
  default     = "enter AMI-ID here"
}

#Configure instance variable
variable "instance" {
  description = "Instance for week 20"
  type        = string
  default     = "t2.micro"
}

#Configure user data - boot strap section
variable "ec2_user_data" {
  description = "User Data for Jenkins Bootstrap"
  type        = string
  default     = <<-EOF
  #!/bin/bash

#Perform software update
   sudo yum update -y

#Add Jenkins repo
   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  
#Import installation key from Jenkins
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  
#Update then delete packages and dependencies
   sudo yum upgrade
  
#Install java (Amazon Linux 2)
   sudo amazon-linux-extras install java-openjdk11 -y

#Install Jenkins
   sudo yum install jenkins -y
  
#Enable Jenkins to start at boot
   sudo systemctl enable jenkins
  
#Start Jenkins
   sudo systemctl start jenkins

#Check Jenkins status
   sudo systemctl status jenkins
   EOF
}

#Configure VPC variable
variable "vpc" {
  description = "Default VPC"
  type        = string
  default     = "insert default VPC ID here"
}