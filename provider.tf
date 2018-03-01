provider "openstack" {
  user_name = "${var.username}"
  tenant_name = "${var.project_name}"
  password  = "${var.password}"
  auth_url  = "${var.auth_url}"
}
