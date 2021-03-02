provider aws {
  region  = "eu-central-1"
  profile = "default"
}

terraform {
  backend "local" {
    path = "state/test/terraform.tfstate"
  }
}

module "ami_share" {
  source = "../"

  ami_name_filter  = "whoo"
  ami_owner_filter = "616116116661"
  accounts_to_share_with = {
    cddev = "616116116662"
    cdsta = "616116116663"
    cdprd = "616116116664"
  }
}
