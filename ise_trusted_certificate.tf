resource "ise_trusted_certificate" "trusted_certificate" {
  for_each = { for cert in try(local.ise.certificates.trusted_certificates, []) : cert.name => cert }

  name                                   = each.key
  certificate_pem                        = each.value.certificate_pem
  description                            = try(each.value.description, local.defaults.ise.certificates.trusted_certificates.description, null)
  trust_for_ise_auth                     = try(each.value.trust_for_ise_auth, local.defaults.ise.certificates.trusted_certificates.trust_for_ise_auth, null)
  trust_for_client_auth                  = try(each.value.trust_for_client_auth, local.defaults.ise.certificates.trusted_certificates.trust_for_client_auth, null)
  trust_for_certificate_based_admin_auth = try(each.value.trust_for_certificate_based_admin_auth, local.defaults.ise.certificates.trusted_certificates.trust_for_certificate_based_admin_auth, null)
  trust_for_cisco_services_auth          = try(each.value.trust_for_cisco_services_auth, local.defaults.ise.certificates.trusted_certificates.trust_for_cisco_services_auth, null)
  allow_basic_constraint_ca_false        = try(each.value.allow_basic_constraint_ca_false, local.defaults.ise.certificates.trusted_certificates.allow_basic_constraint_ca_false, null)
  allow_multiple_cn_cert                 = try(each.value.allow_multiple_cn_cert, local.defaults.ise.certificates.trusted_certificates.allow_multiple_cn_cert, null)
  allow_out_of_date_cert                 = try(each.value.allow_out_of_date_cert, local.defaults.ise.certificates.trusted_certificates.allow_out_of_date_cert, null)
  allow_sha1_certificates                = try(each.value.allow_sha1_certificates, local.defaults.ise.certificates.trusted_certificates.allow_sha1_certificates, null)
  validate_certificate_extensions        = try(each.value.validate_certificate_extensions, local.defaults.ise.certificates.trusted_certificates.validate_certificate_extensions, null)
  authenticate_before_crl_received       = try(each.value.authenticate_before_crl_received, local.defaults.ise.certificates.trusted_certificates.authenticate_before_crl_received, null)
  automatic_crl_update                   = try(each.value.automatic_crl_update, local.defaults.ise.certificates.trusted_certificates.automatic_crl_update, null)
  automatic_crl_update_period            = try(each.value.automatic_crl_update_period, local.defaults.ise.certificates.trusted_certificates.automatic_crl_update_period, null)
  automatic_crl_update_units             = try(each.value.automatic_crl_update_units, local.defaults.ise.certificates.trusted_certificates.automatic_crl_update_units, null)
  crl_distribution_url                   = try(each.value.crl_distribution_url, local.defaults.ise.certificates.trusted_certificates.crl_distribution_url, null)
  crl_download_failure_retries           = try(each.value.crl_download_failure_retries, local.defaults.ise.certificates.trusted_certificates.crl_download_failure_retries, null)
  crl_download_failure_retries_units     = try(each.value.crl_download_failure_retries_units, local.defaults.ise.certificates.trusted_certificates.crl_download_failure_retries_units, null)
  download_crl                           = try(each.value.download_crl, local.defaults.ise.certificates.trusted_certificates.download_crl, null)
  enable_ocsp_validation                 = try(each.value.enable_ocsp_validation, local.defaults.ise.certificates.trusted_certificates.enable_ocsp_validation, null)
  enable_server_identity_check           = try(each.value.enable_server_identity_check, local.defaults.ise.certificates.trusted_certificates.enable_server_identity_check, null)
  ignore_crl_expiration                  = try(each.value.ignore_crl_expiration, local.defaults.ise.certificates.trusted_certificates.ignore_crl_expiration, null)
  non_automatic_crl_update_period        = try(each.value.non_automatic_crl_update_period, local.defaults.ise.certificates.trusted_certificates.non_automatic_crl_update_period, null)
  non_automatic_crl_update_units         = try(each.value.non_automatic_crl_update_units, local.defaults.ise.certificates.trusted_certificates.non_automatic_crl_update_units, null)
  reject_if_no_status_from_ocsp          = try(each.value.reject_if_no_status_from_ocsp, local.defaults.ise.certificates.trusted_certificates.reject_if_no_status_from_ocsp, null)
  reject_if_unreachable_from_ocsp        = try(each.value.reject_if_unreachable_from_ocsp, local.defaults.ise.certificates.trusted_certificates.reject_if_unreachable_from_ocsp, null)
  selected_ocsp_service                  = try(each.value.selected_ocsp_service, local.defaults.ise.certificates.trusted_certificates.selected_ocsp_service, null)
  status                                 = try(each.value.status, local.defaults.ise.certificates.trusted_certificates.status, null)
}
