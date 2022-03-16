resource "helm_release" "cm" {
  name             = "cm"
  namespace        = "cert-manager"
  create_namespace = true
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = "v1.5.3"
  values = [
    file("cert-manager-values.yaml")
  ]
    depends_on = [kind_cluster.default]

}