#############################################
# Variable
#############################################

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "resource_tags" {
  type        = map(string)
  default     = null
  description = "Additional Tags that need to be attached to every resource."
}