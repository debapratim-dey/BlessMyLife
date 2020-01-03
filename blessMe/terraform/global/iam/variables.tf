variable "region" {
  description = "Region"
  type = string
  default = "eu-east-2"
}

variable "kms-key-arn" {
  description = "ARN of Bless KMS Key for encryption & Decryption of Passwords"
  type = string
}
