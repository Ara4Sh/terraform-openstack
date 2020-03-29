resource "openstack_compute_instance_v2" "Instance" {
  count = var.instance_num
  name = format("%s-%02d", var.instance_name, count.index+1)
  image_id = var.image_id
  flavor_id = var.flavor_id
  key_pair = var.keypair_name
  security_groups = var.security_groups
  network {
    name = var.network_name
  }
  user_data = file("bootstrap.sh")
}

resource "openstack_networking_floatingip_v2" "fip" {
  count = var.instance_num
  pool = var.floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  count = var.instance_num
  floating_ip = element(openstack_networking_floatingip_v2.fip.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.Instance.*.id, count.index)
}

output "instance_ips" {
    value = {
        for instance in openstack_compute_instance_v2.Instance:
         instance.name => instance.access_ip_v4
    }
}

output "float_ips" {
    value = {
        for fip in openstack_networking_floatingip_v2.fip:
            fip.fixed_ip => fip.address
    }
}
