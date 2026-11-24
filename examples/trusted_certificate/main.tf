module "ise" {
  source = "../.."

  yaml_files = ["${path.module}/trusted_certificate.yaml"]
}
