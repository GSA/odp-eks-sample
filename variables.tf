variable "project" {
    default = "odp-eks"
    type = string
    description = "Variable used for naming prefix and tagging."
}

variable "region" {
    default = "us-east-1"
    type = string
    description = "Variable used for defining region."
}