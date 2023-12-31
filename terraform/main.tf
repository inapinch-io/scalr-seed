data "scalr_vcs_provider" "github" {
  name       = "inapinch"
  account_id = var.account
}

data "scalr_environment" "default" {
  name       = "Environment-A"
  account_id = var.account
}

resource "scalr_workspace" "example" {
  name            = "my-workspace-name"
  environment_id  = data.scalr_environment.default.id
  vcs_provider_id = data.scalr_vcs_provider.github.id

  working_directory = "example/path"

  vcs_repo {
    identifier       = "org/repo"
    branch           = "dev"
    trigger_prefixes = ["stage", "prod"]
  }

  provider_configuration {
    id    = "pcfg-xxxxxxxxxx"
    alias = "us_east1"
  }
  provider_configuration {
    id    = "pcfg-yyyyyyyyyy"
    alias = "us_east2"
  }
}