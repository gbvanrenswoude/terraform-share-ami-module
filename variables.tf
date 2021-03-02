variable "released_ami_number" {
  description = "Number of AMIs for Terraform to track and cycle"
  type        = number
  default     = 5
}

variable "ami_name_filter" {
  description = "AMI name to look up"
  type        = string
}

variable "ami_virtualization_type" {
  description = "The virtualization type, defaults to hvm"
  type        = string
  default     = "hvm"
}

variable "ami_owner_filter" {
  description = "AMI owner to look AMIs up from"
  type        = string
}

variable accounts_to_share_with {
  type = map(string)
}
