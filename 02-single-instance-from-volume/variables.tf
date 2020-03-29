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
