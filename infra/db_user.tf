# Create a Database User
resource "mongodbatlas_database_user" "admin" {
  username           = var.mongo_database_admin_user
  password           = var.mongo_database_admin_password
  project_id         = mongodbatlas_project.atlas_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "db-fiap-fastfood"
  }
}

resource "mongodbatlas_database_user" "application" {
  username           = var.mongo_database_app_user
  password           = var.mongo_database_app_password
  project_id         = mongodbatlas_project.atlas_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.mongo_database_name
  }

  # mongodbatlas_database_user resource type includes repeatable nested blocks of roles,
  # which represent separate objects that are embedded within the containing object.
  # We want to construct repeatable nested blocks while keeping them embedded within
  # a single resource. One user, but multiple roles assigned to it.

  content {
    role_name     = "readWrite"
    database_name = var.mongo_database_name
  }

}
