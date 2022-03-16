create-cluster:
	kind create cluster --name multi-node-cluster --config multi-node-cluster.yaml

init: 
	terraform init

apply:
	terraform apply --auto-approve

proxy:
	sudo kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 80 &
	sudo kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 443 &

ingress-self-signed: 
	kubectl create -f ../kubernetes/self-signed/certs


ingress-letsencrpyt:
	kubectl create -f ../kubernetes/letsencrpyt/certs

service:
	kubectl create -f ../kubernetes/service/nginx-service.yaml

apply-self-signed: apply ingress-self-signed service proxy
	kubectl create -f ../kubernetes/self-signed/nginx-ingress-self-signed.yaml


apply-letsencrypt: apply ingress-letsencrpyt
	kubectl create -f ../kubernetes/letsencrpyt/nginx-ingress-letsencrypt.yaml



plan:
	terraform plan

destroy:
	terraform destroy
