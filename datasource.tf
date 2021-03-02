data "aws_ami_ids" "released_amis" {
  //  sort_ascending = true
  owners = [var.ami_owner_filter]
  filter {
    name = "virtualization-type"
    values = [
    var.ami_virtualization_type]
  }
  filter {
    name = "name"
    values = [
    var.ami_name_filter]
  }
}
