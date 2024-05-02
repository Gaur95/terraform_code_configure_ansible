output "masterip" {
  value = aws_instance.myinst.public_ip
}
output "worker1_public" {
    value = aws_instance.myinst1.public_ip
  
}
output "worker1_private" {
    value = aws_instance.myinst1.private_ip
  
}
output "worker2_public" {
    value = aws_instance.myinst2.public_ip
  
}
output "worker2_private" {
  value = aws_instance.myinst2.private_ip
}