# Slurm DevOps Upgrade: Terraform practice (Yandex Cloud provider)
## How to use:
### Install Yandex Cloud CLI:
```
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
```
### Export Yandex Cloud and TF env:
```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
export TF_VAR_folder_id=$(yc config get folder-id)
```
### Create the image with Packer:
```
cd slurm-tf-final-project/packer/
packer build .
*Imagе name can be set by variables image_name and image_tag*
```
### Deploy your infrastructure to the Yandex Cloud:
```
cd slurm-tf-final-project/terraform/
terraform init
terraform apply 
```

