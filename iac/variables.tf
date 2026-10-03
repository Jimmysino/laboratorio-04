variable "web_server_port" {
  description = "The port on which the web server is exposed"
  type        = map(number)
}

variable "api_server_port" {
  description = "The port on which the api server is exposed"
  type        = map(number)
}