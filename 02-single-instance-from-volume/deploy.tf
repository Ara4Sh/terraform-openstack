resource "openstack_compute_instance_v2" "Instance" {
  name = var.instance_name
  flavor_id = var.flavor_id
  key_pair = var.keypair_name
  security_groups = var.security_groups
  network {
    name = var.network_name
  }
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = var.volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }
  user_data = file("bootstrap.sh")
}

resource "openstack_networking_floatingip_v2" "fip" {
  pool = var.floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.Instance.id
}

output "instance_ip" {
    value = openstack_compute_instance_v2.Instance.access_ip_v4
}

output "float_ip" {
    value = openstack_networking_floatingip_v2.fip.address
}
