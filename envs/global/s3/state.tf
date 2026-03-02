terraform {
  backend "s3" {
    # region and bucket will be retrieved from state.config file during terraform init
    region       = ""
    bucket       = ""
    key          = "global/s3/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
  }
}