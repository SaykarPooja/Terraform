# Terraform

What is terraform and why we need it?

Terraform is an Infrastructure-as-Code tool that automates provisioning, manages state, and ensures consistent and repeatable cloud infrastructure deployments



it is mainly used for reusablity and security

==========================================================================================
# Install and Configure Terraform



1.Download Terraform from the official website:
👉 https://developer.hashicorp.com/terraform/downloads

2.Extract the Terraform ZIP file into a newly created folder in C: or D: drive (example: C:\Terraform) and copy the folder path.

3.Set up the Environment Variable:

Search → Edit the system environment variables
Click Environment Variables
Under System Variables, select Path → Edit
Click New → paste the Terraform folder path
Click OK → OK (Done)

4.Create and Run Terraform Configuration

Open VS Code
Open the Terraform folder (from Step 2)
Create a new file, for example: ec2.tf
Write or paste the Terraform configuration code
Open a new terminal in VS Code

Initialize Terraform:

i.terraform init

ii.Validate configuration:

iii.terraform validate

iv.terraform destroy --auto-approve

-----------------------------------------

**In above all step we are exposing our secret and access keys so in order to avoid that -**

1.Download AWS CLI for Windows:
👉 https://awscli.amazonaws.com/AWSCLIV2.msi

Verify installation:
aws --version


2.Configure AWS credentials:
aws configure

Enter:

AWS Access Key ID

AWS Secret Access Key

Default region (e.g., ap-south-1)

Output format (json)

3now without secret key and acces key we can directly run our .tf files in vs code 
