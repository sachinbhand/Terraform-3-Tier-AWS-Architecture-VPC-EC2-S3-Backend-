resource "aws_vpc" "custom_vpc"{
    cidr_block= var.vpc_cidr_block
    tags={
        Name= "custom_vpc"
    }

}


resource "aws_subnet" "public_subnet"{
    cidr_block= var.pub_cidr_block
    vpc_id= aws_vpc.custom_vpc.id
    availability_zone= "ap-south-1a"
    tags={
        Name= "public_subnet"
    }
}
 resource "aws_internet_gateway" "custom_igw"{
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "custom_igw"

    }
 }

 resource "aws_route_table" "public_rt"{
 vpc_id= aws_vpc.custom_vpc.id
 tags={
    Name= "public_rt"
  }
  route {
    cidr_block="0.0.0.0/0"
    gateway_id= aws_internet_gateway.custom_igw.id
  }
 }

 resource "aws_route_table_association" "subnetaddition"{
    subnet_id= aws_subnet.public_subnet.id
    route_table_id= aws_route_table.public_rt.id
 }
 
 
 
 
 
 
 
 resource "aws_subnet" "private_subnet"{
    cidr_block= var.pri_cidr_block
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "private_subnet"
    }
 }


 resource "aws_route_table" "private_rt"{
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "private_rt"
  }
 }

 resource "aws_route_table_association" "subnetadd"{
    subnet_id= aws_subnet.private_subnet.id
    route_table_id= aws_route_table.private_rt.id
 }

 
 
 
 
 resource "aws_subnet" "data_subnet"{
    cidr_block=var.db_cidr_block
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "data_subnet"
    }
 }


 resource "aws_route_table" "database_route"{
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "database_route"
    }
 }

 resource "aws_route_table_association" "subnetaddd"{
    subnet_id= aws_subnet.data_subnet.id
    route_table_id= aws_route_table.database_route.id
 }



 resource "aws_instance" "web_server"{
    ami= var.ami
    instance_type= var.instance_type
    subnet_id= aws_subnet.private_subnet.id
    tags={ 
        Name= "web_server"
    }
    vpc_security_group_ids= [aws_security_group.web_sg.id]
 }

 
 resource "aws_instance" "app_server"{
    ami= var.ami
    instance_type= var.instance_type
    subnet_id= aws_subnet.private_subnet.id
    tags={ 
        Name= "app_server"
    }
 }

 
 resource "aws_instance" "data_server"{
    ami= var.ami
    instance_type= var.instance_type
    subnet_id= aws_subnet.data_subnet.id
    tags={ 
        Name= "db_server"
    }
 }



 resource "aws_security_group" "web_sg" {
    vpc_id= aws_vpc.custom_vpc.id
    tags={
        Name= "web_sg"
    }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}