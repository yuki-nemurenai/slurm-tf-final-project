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

resource "yandex_alb_backend_group" "this" {
  name = "ws-backend-group"

  http_backend {
    name             = "ws-http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.this.id]
    load_balancing_config {
      panic_threshold = 50
    }
    healthcheck {
      timeout  = "1s"
      interval = "1s"
      healthcheck_port = 80
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "this" {
  name        = "my-load-balancer"

  network_id  = yandex_vpc_network.this.id

  allocation_policy {
    dynamic "location" {
      for_each = toset(var.az)
      content {
        zone_id   = location.value
        subnet_id = yandex_vpc_subnet.this[location.value].id
      }
    }
  }

  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80 ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.this.id
      }
    }
  }

  log_options {
    discard_rule {
      http_code_intervals = ["HTTP_2XX"]
      discard_percent = 75
    }
  }
}

resource "yandex_alb_http_router" "this" {
  name      = "my-http-router"
}
