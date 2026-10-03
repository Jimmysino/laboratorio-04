resource "docker_image" "postgres" {
  name         = "postgres:latest"
}

resource "docker_container" "bd" {
  image = docker_image.postgres.image_id
  name  = "bd-${terraform.workspace}"
  env   = ["POSTGRES_PASSWORD=postgres"]
  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
}

output "bd_port" {
  value = docker_container.bd.ports[0].external
}