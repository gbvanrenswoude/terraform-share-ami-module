output "full_ami_list" {
  value = data.aws_ami_ids.released_amis.ids
}

output "ami_list" {
  value = local.ami_list
}

output "account_list" {
  value = local.account_list
}

output "cartesian_product" {
  value = local.entry
}
