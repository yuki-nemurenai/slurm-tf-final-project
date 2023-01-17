resource "yandex_alb_target_group" "this" {
  name      = "my-target-group"

  dynamic "target" {
    for_each = yandex_compute_instance_group.this.instances
    content {
      subnet_id = target.value.network_interface.0.subnet_id
      ip_address   = target.value.network_interface.0.ip_address
    }
  }
}
