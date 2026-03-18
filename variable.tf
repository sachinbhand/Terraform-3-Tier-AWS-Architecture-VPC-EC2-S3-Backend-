variable "region"{
    default= "ap-south-1"

}

variable "vpc_cidr_block"{
    default= "30.0.0.0/16"
}

variable "pub_cidr_block"{
    default= "30.0.3.0/24"
}

variable "pri_cidr_block"{
    default= "30.0.4.0/24"
}

variable "db_cidr_block"{
    default= "30.0.5.0/24"
}

variable "ami"{
    default= "ami-0a14f53a6fe4dfcd1"

}

variable "instance_type"{
    default= "t3.micro" 
}