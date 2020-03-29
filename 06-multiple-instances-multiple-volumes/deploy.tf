resource "openstack_compute_instance_v2" "Instance" {
  count = var.instance_num
  name = format("%s-%02d", var.instance_name, count.index+1)
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
  dynamic block_device {
    for_each = [for volume in var.volume_list: {
            boot_index = volume.boot_index
            size = volume.size
    }]
    content {
        source_type           = "blank"
        volume_size           = block_device.value.size
        boot_index            = block_device.value.boot_index
        destination_type      = "volume"
        delete_on_termination = false
    }
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
