# Lab IaC - Terraform + Docker


Despliegue un front un back y una base de datos

Cada contenedor usa el nombre del workspace (web-dev, api-qa, bd-dev) para que no se pisen los entornos

El uso seria 


terraform init
terraform workspace new dev
terraform workspace new qa

terraform workspace select dev
terraform plan
terraform apply

terraform workspace select qa
terraform plan
terraform apply

docker ps