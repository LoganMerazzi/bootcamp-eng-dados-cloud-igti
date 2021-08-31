variable "aws_region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMRaovivo"
}

variable "key_pair_name" {
  default = "keypair_logan_igti_edc"
}

variable "airflow_subnet_id" {
  default = "subnet-97bf2bfc"
}

variable "vpc_id" {
  default = "vpc-667e120d"
}
