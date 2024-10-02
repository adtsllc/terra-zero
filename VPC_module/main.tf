
# TERRAFORM description to vpc creation
# Step 1 : Create a VPC
resource "aws_vpc" "adtsllc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames =  true
  tags = {
    Name = "${var.project_name}-${var.enviroment}-vpc"
  }
}

# Step 4 create Internet Gateway (IGW)
resource "aws_internet_gateway" "dtsllc-igw" {
  vpc_id = aws_vpc.adtsllc.id
  tags = {
    Name = "${var.project_name}-${var.enviroment}-igw"
  }
}

#  use data source to get all avalability zones in region
data "aws_availability_zones" "adtsllcaz" {}


# step 2 create a public subnet az1
resource "aws_subnet" "dtsllc-public" {
  vpc_id     = aws_vpc.adtsllc.id
  cidr_block = var.dtsllc-public_cidr
  availability_zone = data.aws_availability_zones.adtsllcaz.name [0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.enviroment}-public-az1"
  }
}

resource "aws_subnet" "dtsllc-public2" {
  vpc_id     = aws_vpc.adtsllc.id
  cidr_block = var.dtsllc-public2_cidr
   availability_zone = data.aws_availability_zones.adtsllcaz.name [1]
   map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.enviroment}-public-az2"
  }
}

# Step 5 route Table for public subnet
resource "aws_route_table" "dtsllc-publicRT" {
  vpc_id = aws_vpc.adtsllc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dtsllc-igw.id
  }
  tags = {
    Name = "${var.project_name}-${var.enviroment}-public-rt"
  }
}

# Step 6 create a Route Table Association for public subnet
resource "aws_route_table_association" "dtsllc-publicRTassociation" {
  subnet_id      = aws_subnet.dtsllc-public.id
  route_table_id = aws_route_table.dtsllc-publicRT.id
}


# Step 6 create a Route Table Association for public subnet
resource "aws_route_table_association" "dtsllc-publicRTassociation" {
  subnet_id      = aws_subnet.dtsllc-public2.id
  route_table_id = aws_route_table.dtsllc-publicRT.id
}




#  step 3 create a private subnet
resource "aws_subnet" "dtsllc-private_app" {
  vpc_id     = aws_vpc.adtsllc.id

  cidr_block = var.dtsllc-private_cidr
  availability_zone = data.aws_availability_zones.adtsllcaz.name [0]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.enviroment}-private-app-az1"
  }
}

# step 3 create a private subnet
resource "aws_subnet" "dtsllc-private2_app" {
  vpc_id     = aws_vpc.adtsllc.id
  cidr_block = var.dtsllc-private2_cidr
  availability_zone = data.aws_availability_zones.adtsllcaz.name [1]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.enviroment}-private2-app-az2"
  }
}


# create private data subnet az1
resource "aws_subnet" "dtsllc-data-private_sub" {
    vpc_id = aws_vpc.adtsllc.id
    cidr_block = var.dtsllc-data-private_sub_cidr
    availability_zone = data.aws_availability_zones.adtsllcaz.name [0]
    map_public_ip_on_launch = false
    tags = {
      Name = "${var.project_name}-${var.enviroment}-private-data-az1"
    }
  
}


# create private data subnet az1
resource "aws_subnet" "dtsllc-data-private2_sub" {
    vpc_id = aws_vpc.adtsllc.id
    cidr_block = var.dtsllc-data-private2_sub_cidr
    availability_zone = data.aws_availability_zones.adtsllcaz.name [1]
    map_public_ip_on_launch = false
    tags = {
      Name = "${var.project_name}-${var.enviroment}-private-data-az2"
    }
}

