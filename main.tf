terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

# -> main.tf <-

# Change docker provider as follows

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx1"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx.latest
  name  = "nginx2"
  ports {
    internal = 80
    external = 8001
  }
}
