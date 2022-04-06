# module "eks-external-dns" {
#     source = "lablabs/eks-external-dns/aws"
#     version = "0.9.0"
#     cluster_identity_oidc_issuer = ""
#     cluster_identity_oidc_issuer_arn = ""
#     settings = {
#         "policy" = "sync"
#     }
#     depends_on = [kind_cluster.default]
# }