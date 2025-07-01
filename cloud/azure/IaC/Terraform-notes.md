Create the following files for modularity and you can combine then in one file
- providers.tf -- loads the providers
- variables.tf -- creates the variables
- maint.tf -- what resources to create
- outputs.tf -- for displaying the created resources.
- Or combine all into one file with an extension of .tf

Commands:
- goto the directory where the above file/s are present
- login to azure
- set the subscription
- terraform init -- to intialize the providers
- terraform plan /terraform plan -out main.tfplan -- to create the plan - which shows how and what resources are created
- terraform apply /terraform apply main.tfplan -- into action by the taking the above plan
- terraform plan -destroy / terraform plan -destroy -out main.destroy.tfplan   --- creates the plan to destroy the resource created earlier
- terraform apply main.destroy.tfplan
- to create the resources we can just use the below two commands
  - terraform init
  - terraform apply
