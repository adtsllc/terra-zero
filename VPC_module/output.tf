
# Export the region
output "Region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# export the environment
output "environment" {
  value = var.enviroment
}

# Export the vpc id
output "vpc_id" {
  value = aws_vpc.adtsllc.id
}

# export the internet gateway
output "dtsllc-igw" {
  value = aws_internet_gateway.dtsllc-igw.id
}

# export the public subnet az1 id
output "dtsllc-public_id" {
  value = aws_subnet.dtsllc-public.id
}

# export the public subnet az1 id
output "dtsllc-public2_id" {
  value = aws_subnet.dtsllc-public2.id
}

#  export the private app subnet
output "dtsllc-private_id" {
  value = aws_subnet.dtsllc-private_app.id
}

#  export the private app subnet2
output "dtsllc-private2_app_id" {
  value = aws_subnet.dtsllc-private2_app.id
}

#  export the private data app subnet
output "tsllc-data-private_sub_id" {
  value = aws_subnet.dtsllc-data-private_sub.id
}

#  export the private data app subnet 2
output "tsllc-data-private2_sub_id" {
  value = aws_subnet.dtsllc-data-private2_sub.id
}

#  export the first avalability zone
output "adtsllcaz" {
  value = data.aws_availability_zones.adtsllcaz.names[0]
}

#  export the 2nd avalability zone
output "dtsllcaz2" {
  value = data.aws_availability_zones.adtsllcaz.name [1]
}

# #  export the private app subnet
# output "" {
#   value = 
# }

# #  export the private app subnet
# output "" {
#   value = 
# }

# #  export the private app subnet
# output "" {
#   value = 
# }

# #  export the private app subnet
# output "" {
#   value = 
# }