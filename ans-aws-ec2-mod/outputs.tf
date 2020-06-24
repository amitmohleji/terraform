
output "ip" {
	value = module.ec2_instances.public_ip[0]
}
output "id" {
	value = module.ec2_instances.id[0]
}
output "tomcat_home" {
	value = "/var/lib/tomcat9"
}