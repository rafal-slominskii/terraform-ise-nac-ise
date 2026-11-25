terraform {
  required_version = ">= 1.11.0"

  required_providers {
    ise = {
      source  = "CiscoDevNet/ise"
      version = "~> 0.5.0"
    }
  }
}

provider "ise" {}

variable "root_certificate_pem" {
  type = string
}

variable "nodes" {
  type = list(object({
    hostname               = string
    address                = string
    admin_certificate_pem  = optional(string)
    admin_ca_pem           = optional(string)
    admin_portal_group_tag = optional(string)
    eap                    = optional(bool, false)
  }))
}

variable "eap_certificate_pem" {
  type    = string
  default = null
}

variable "eap_ca_pem" {
  type    = string
  default = null
}

variable "private_keys" {
  type      = map(string)
  sensitive = true
  ephemeral = true
}

variable "private_keys_version" {
  type = number
}

module "ise" {
  source = "../.."

  system_certificate_private_keys = var.private_keys
  model = {
    ise = {
      certificates = {
        trusted_certificates = [{
          name               = "System Certificate Root CA"
          certificate_pem    = var.root_certificate_pem
          trust_for_ise_auth = true
        }]
        system_certificate_deployment = {
          root_certificate_pem    = var.root_certificate_pem
          nodes                   = var.nodes
          eap_certificate_pem     = var.eap_certificate_pem
          eap_ca_pem              = var.eap_ca_pem
          private_keys_wo_version = var.private_keys_version
        }
      }
    }
  }
}
