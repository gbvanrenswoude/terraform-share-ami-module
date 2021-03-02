locals {
  ami_list     = slice(data.aws_ami_ids.released_amis.ids, 0, var.released_ami_number)
  account_list = concat(values(var.accounts_to_share_with)) // possible to add different lists
  entry = { for p in setproduct(local.ami_list, local.account_list) : "${p[0]}/${p[1]}" => {
    ami     = p[0]
    account = p[1]
    }
  }
}

resource "aws_ami_launch_permission" "shared_ami" {
  for_each   = local.entry
  image_id   = each.value.ami
  account_id = each.value.account
}
