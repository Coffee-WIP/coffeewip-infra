# CoffeeWIP Infra as code

## Kubernetes Cluster on GKE using Terraform

Login with gcloud to your account, select default project, and enable auth as a service with your user account.
```
gcloud auth login
gcloud config set project <project_id>
gcloud auth application-default login
```
_TODO: Create a service account_

If your haven't created a cluster on GKE, enable its API in the web console, or use:
```
gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable container.googleapis.com
```

Edit `terraform.tfvars` to set your GCP project id.

Initialize terraform, see the plan, and apply it.
```
terraform init
terraform plan
terraform apply
```

_TODO: Store state in cloud storage_

Get kubeconfig credentials for the created cluster
```
gcloud container clusters get-credentials coffeewip-cluster --region europe-west2
```

### References

* https://www.padok.fr/en/blog/kubernetes-google-cloud-terraform-cluster
* https://pbhadani.com/posts/gke-terraform/
* https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster
* https://www.terraform.io/docs/providers/google/guides/using_gke_with_terraform.html
* https://www.terraform.io/docs/providers/google/r/container_cluster.html