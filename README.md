**Deployment of DigitalOcean DOKS cluster to the `tor1` region using Terraform**

- Kustomize configuration files that can be deployed to this cluster located [here](https://github.com/Lisa-Stats/do-clj-kustomize)

Uses Terraform modules to create:
- VPC
- Container registry
- DOKS cluster
  - 2 managed node pools

Stores state remotely in DigitalOcean Spaces

**Getting Started**

1. Make sure that doctl is installed and configured https://docs.digitalocean.com/reference/doctl/how-to/install/
2. Set the env variable `DIGITALOCEAN_TOKEN='<your-personal-access-token>'`
3. Create DigitalOcean Space using their [UI](https://docs.digitalocean.com/products/spaces/how-to/create/)
   - After, create a spaces key
     - Set the env variable      `DO_SPACES_ACCESS_KEY='<your-access-key>'`
     - Set the env variable      `DO_SPACES_SECRET_KEY='<your-secret-key>'`
4. Initialize terraform with the created backend
-     terraform init --backend-config=access_key=$DO_SPACES_ACCESS_KEY --backend-config=secret_key=$DO_SPACES_SECRET_KEY
3. Run terraform plan to see what resources will be created
4. Run terraform apply to create those resources
