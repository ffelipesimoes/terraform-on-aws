#Output - Fo Loop with List
output "for_output_list" {
  description = "For loop with List"
  value       = [for cadaInstance in aws_instance.myec2vm : cadaInstance.public_dns]
}
#Output - Fo Loop with Map
output "for_output_map1" {
  description = "For loop with Map"
  value       = { for cadaInstance in aws_instance.myec2vm : cadaInstance.id => cadaInstance.public_dns }
}
#Output - Fo Loop with Map Advanced
output "for_output_map2" {
  description = "For loop with Map2"
  value       = { for c, cadaInstance in aws_instance.myec2vm : c => cadaInstance.public_dns }
}

# Output Legacy Splat Operator (latest) - Returns the List
output "legacy_splat_instance_publicip" {
  description = "Legacy Splat Expression"
  # value       = aws_instance.myec2vm.*.public_dns
  value = [for instance in aws_instance.myec2vm : instance.public_ip]
}

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value       = toset([for instance in aws_instance.myec2vm : instance.public_dns])
}
output "instance_publicdns2" {
  description = "instance_publicdns2"
  value       = { for az, instance in aws_instance.myec2vm : az => instance.public_dns }
}
