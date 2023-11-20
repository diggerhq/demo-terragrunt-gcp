remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "digger-demo-terragrunt-gcp-backend"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = "digger-landing"
    location  = "europe-west2"
  }
}