# output "certificate_txt_records" {
#   value = data.local_file.certificate_txt_records.content
# }

output "lb_hostname" {
  value = data.kubernetes_service.ingress_nginx.status[0].load_balancer[0].ingress[0].hostname
}
