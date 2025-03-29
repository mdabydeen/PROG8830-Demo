resource "random_password" "db_password" {
  length  = 16
  special = true
}


locals {
  username = "mike"
  password = random_password.db_password.result
}