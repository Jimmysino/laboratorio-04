resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "webserver" {
  image = docker_image.nginx.image_id
  name  = "web-server"
  ports {
    internal = 80
    external = var.web_server_port
  }
}

output "web_server_port" {
  value = docker_container.webserver.ports[0].external
}

variable "web_server_port" {
  description = "The port on which the web server is exposed"
  type        = number
  default     = 3001
}
