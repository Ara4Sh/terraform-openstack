variable "project_name" {
    description = "The name of the Tenant/Project."
    default = "<Project Name>"
}

variable "username" {
    description = "The username for the OpenStack."
    default = "<Username>"
}

variable "password" {
    description = "The password for the OpenStack user."
    default = "<Password>"
}

variable "auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default = "http://<Endpoint Address>:5000/v2.0"
}

variable "keypair" {
    description = "The keypair to be used."
    default = "<KeyPair>"
}

variable "network" {
    description = "The network to be used."
    default = "<Network Name>"
}

variable "zone_name" {
    description = "The Availablity Zone name."
    default = "<Zone Name>"
}
