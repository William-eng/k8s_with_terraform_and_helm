# Create namespace
resource "kubernetes_namespace" "tools" {
  metadata {
    name = "tools"
    labels = {
      name = "tools"
    }
  }
}

# Helm Release for Artifactory
resource "helm_release" "artifactory" {
  depends_on = [
    null_resource.update_kubeconfig
  ]

  name       = "artifactory"
  repository = "https://charts.jfrog.io"
  chart      = "artifactory"
  version    = "107.90.10"
  namespace  = kubernetes_namespace.tools.metadata[0].name

  values = [
    "${file("./values.yaml")}"
  ]

  timeout = 600 # Timeout in seconds (10 minutes)
}



# # This command waits for specific CRDs from cert-manager to reach the Established condition:
# resource "null_resource" "wait_for_cert_manager_crds" {
#   depends_on = [helm_release.artifactory]

#   provisioner "local-exec" {
#     command = <<EOF
#       kubectl wait --for=condition=Established --timeout=600s \
#         crd/certificates.cert-manager.io \
#         crd/clusterissuers.cert-manager.io \
#         crd/issuers.cert-manager.io
#     EOF
#   }
# }
