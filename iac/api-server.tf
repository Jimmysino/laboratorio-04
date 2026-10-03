resource "docker_image" "node" {
  name         = "embarkx/hello-node:latest"
  keep_locally = true
}

resource "docker_container" "apiserver" {
  image = docker_image.node.image_id
  name  = "api-${terraform.workspace}"
  ports {
    internal = 3000
    external = var.api_server_port[terraform.workspace]
  }
}

output "api_server_port" {
  value = docker_container.apiserver.ports[0].external
}