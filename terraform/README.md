# 1 AWS Credentials Setup 
Create Terraform_AWS_Final_L1 users and gives you AdministratorAccess 
![Screenshot_316](https://user-images.githubusercontent.com/123692654/216515594-181801f0-a8ce-4fdc-9acd-697949d35f61.png)
![Screenshot_317](https://user-images.githubusercontent.com/123692654/216515597-2b89a942-6f12-4854-b2cd-80c33e7b4fa0.png)

# 1.2 Install Terraform on VM shaly@vladymir

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update
sudo apt install terraform
terraform version
```
![1 1](https://user-images.githubusercontent.com/123692654/216516239-7d30dd85-fdf9-4ba7-ae93-3de0f4e65025.jpg)

# 2. Terraform. First steps
 
#2.1 Create project folder and main.tf file
Add exception to .gitingnore file:
```Terraform/main.tf```
Run in this folder [Terraform/main] with command: ```terraform init```
Then wait for dowloading (AWS) provider plugins
![1 2](https://user-images.githubusercontent.com/123692654/216520572-4b719190-8982-47f0-a1b2-c8d4608dede1.jpg)

``` export AWS_ACCESS_KEY_ID=  ```
``` export AWS_SECRET_ACCESS_KEY_ID=   ```

```



```