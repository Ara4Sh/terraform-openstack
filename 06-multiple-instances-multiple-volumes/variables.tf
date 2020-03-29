variable "keypair_name" {
    description = "The keypair to be used."
    default  = ""
}

variable "network_name" {
    description = "The network to be used."
    default  = ""
}

variable "instance_name" {
    description = "The Instance Name to be used."
    default  = ""
}

variable "image_id" {
    description = "The image ID to be used."
    default  = ""
}

variable "flavor_id" {
    description = "The flavor id to be used."
    default  = ""
}

variable "instance_num" {
    description = "The Number of instances to be created."
    default  = 
}

variable "floating_ip_pool" {
    description = "The pool to be used to get floating ip"
    default = ""
}

variable "volume_size" {
    description = "The size of volume used to instantiate the instance"
    default = 
}

variable "security_groups" {
    description = "List of security group"
    type = list
    default = ["default"]
}

variable "volume_list" {
    description = "List of Volumes to be created"
    default = [
    {
        boot_index = 1,
        size = 20
    },
    {
        boot_index = 2,
        size = 100
    },
    {
        boot_index = 3,
        size = 100
    },
    {
        boot_index = 4,
        size = 100
    },
    {
        boot_index = 5,
        size = 100
    },
 ]
}
