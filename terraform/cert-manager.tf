# resource "helm_release" "cm" {
#   name             = "cm"
#   namespace        = "cert-manager"
#   create_namespace = true
#   chart            = "cert-manager"
#   repository       = "https://charts.jetstack.io"
#   version          = "v1.5.3"
#   values = [
#     file("cert-manager-values.yaml")
#   ]
#     depends_on = [kind_cluster.default]

# }

module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"
  version = "2.4.1"
  cluster_issuer_email =  "shukomango@gmail.com"
  cluster_issuer_name = "letsencrypt-cluster-issuer"
  cluster_issuer_private_key_secret_name = "letsencrypt-cluster-issuer-key"
  depends_on = [kind_cluster.default]

}