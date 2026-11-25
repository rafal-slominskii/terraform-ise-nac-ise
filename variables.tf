variable "yaml_directories" {
  description = "List of paths to YAML directories."
  type        = list(string)
  default     = []
}

variable "yaml_files" {
  description = "List of paths to YAML files."
  type        = list(string)
  default     = []
}

variable "model" {
  description = "As an alternative to YAML files, a native Terraform data structure can be provided as well."
  type        = map(any)
  default     = {}
}

variable "write_default_values_file" {
  description = "Write all default values to a YAML file. Value is a path pointing to the file to be created."
  type        = string
  default     = ""
}

variable "system_certificate_private_keys" {
  description = "Private keys for the system certificate deployment, keyed by node FQDN and eap. Increment private_keys_wo_version in the data model when keys change. Passed only to write-only provider inputs."
  type        = map(string)
  default     = {}
  nullable    = false
  sensitive   = true
  ephemeral   = true
}
