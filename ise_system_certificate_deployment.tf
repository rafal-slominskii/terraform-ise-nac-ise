resource "ise_system_certificate_deployment" "system_certificate_deployment" {
  for_each = try(local.ise.certificates.system_certificate_deployment, null) == null ? {} : {
    deployment = local.ise.certificates.system_certificate_deployment
  }

  root_certificate_pem = each.value.root_certificate_pem
  nodes = [for node in each.value.nodes : {
    hostname               = node.hostname
    address                = node.address
    admin_certificate_pem  = try(node.admin_certificate_pem, local.defaults.ise.certificates.system_certificate_deployment.nodes.admin_certificate_pem, null)
    admin_ca_pem           = try(node.admin_ca_pem, local.defaults.ise.certificates.system_certificate_deployment.nodes.admin_ca_pem, null)
    admin_portal_group_tag = try(node.admin_portal_group_tag, local.defaults.ise.certificates.system_certificate_deployment.nodes.admin_portal_group_tag, null)
    eap                    = try(node.eap, local.defaults.ise.certificates.system_certificate_deployment.nodes.eap, null)
  }]
  eap_certificate_pem     = try(each.value.eap_certificate_pem, local.defaults.ise.certificates.system_certificate_deployment.eap_certificate_pem, null)
  eap_ca_pem              = try(each.value.eap_ca_pem, local.defaults.ise.certificates.system_certificate_deployment.eap_ca_pem, null)
  private_keys_wo         = var.system_certificate_private_keys
  private_keys_wo_version = try(each.value.private_keys_wo_version, local.defaults.ise.certificates.system_certificate_deployment.private_keys_wo_version, null)
  timeout_seconds         = try(each.value.timeout_seconds, local.defaults.ise.certificates.system_certificate_deployment.timeout_seconds, null)

  depends_on = [ise_trusted_certificate.trusted_certificate]
}
