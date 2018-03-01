variable "count" {
  default = 4
}
resource "openstack_compute_instance_v2" "TestVM" {
  count = "${var.count}"
  name = "${format("TestVM-%02d", count.index+1)}"
  image_name = "<Image Name>"
  availability_zone = "${var.zone_name}"
  flavor_id = "<Flavor uuid>"
  key_pair = "${var.keypair}"
  security_groups = ["default"]
  network {
    name = "${var.network}"
  }
  # user_data = "${file("bootstrap.sh")}"
}


resource "openstack_networking_floatingip_v2" "fip_1" {
  count = "${var.count}"
  pool = "<Pool Name>"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  count = "${var.count}"
  floating_ip = "${element(openstack_networking_floatingip_v2.fip_1.*.address, count.index)}"
  instance_id = "${element(openstack_compute_instance_v2.TestVM.*.id, count.index)}"
}
