# Terraform-share-ami-module
A Terraform module for sharing AMI using Image Permissions. It tracks the newest n number of AMIs automatically and shares the new ones with your customer AWS accounts and unshares the old / unsupported ones.


## What does the module do
This module fetches a list of AMIs in your account using the AMI datasource. It sorts them on date of creation, with the newest first and the oldest last.
Then it loops thru the newest n <variable released_ami_number> and makes sure they are shared with the <variable accounts_to_share_with>. It will in this way automatically unshare the old AMIs and share new AMIs with a backwards support of n <variable released_ami_number>.

Example implementation:

```hcl
module "ami_share" {
  source = "../"

  ami_name_filter = "whoo-these-are-the-amis-i-build*"
  ami_owner_filter   = "616116116661" // its me I produce AMIs in this account !
  accounts_to_share_with = {
    customer1 = "616116116662"  // my customers !
    customer2 = "616116116663"
    customer3 = "616116116664"
  }
}
```

If you build your AMI encrypted, make sure to add grants to the KMS key for the automation roles that your customers use to spin up your AMIs.
