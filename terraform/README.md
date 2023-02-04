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
![Screenshot_316](https://user-images.githubusercontent.com/123692654/216741232-8b9e22db-193a-499d-8801-12b0fb1679d9.png)
![Screenshot_317](https://user-images.githubusercontent.com/123692654/216741235-4555ed93-eacf-4628-bf5f-cec730d5ec80.png)
![Screenshot_318](https://user-images.githubusercontent.com/123692654/216741236-72ffbb34-f4cc-4417-9b74-7dcc2cfaf587.png)
![Screenshot_319](https://user-images.githubusercontent.com/123692654/216741237-126dbf1d-d213-4e23-811f-86b5f8d25606.png)

![Screenshot_320](https://user-images.githubusercontent.com/123692654/216741258-f65f27ab-0fde-4f5f-8873-5b6e64fbdd3a.png)
![Screenshot_321](https://user-images.githubusercontent.com/123692654/216741259-8e541388-82f3-4c5d-ab01-4c21c7803a83.png)
![Screenshot_322](https://user-images.githubusercontent.com/123692654/216741260-f6e89572-4b79-48b0-9547-1d3b4e18b926.png)
![Screenshot_323](https://user-images.githubusercontent.com/123692654/216741262-94df2e92-6e87-4a50-b199-587bfaafb6d5.png)
![Screenshot_324](https://user-images.githubusercontent.com/123692654/216741264-9e4f7084-5e82-4e07-a4e7-3d0ee85b46ca.png)
![Screenshot_325](https://user-images.githubusercontent.com/123692654/216741265-c752532a-1d5e-40b7-a540-40fbd50f68e7.png)



![Screenshot_326](https://user-images.githubusercontent.com/123692654/216741397-0aac547c-8ab5-432f-8f10-679c722b396f.png)
![Screenshot_327](https://user-images.githubusercontent.com/123692654/216741399-5056b8ee-d8b6-4482-bf27-cd81badf8d53.png)
![Screenshot_328](https://user-images.githubusercontent.com/123692654/216741400-b06c663d-deb7-4dd8-ad75-cbd771391c2a.png)
![Screenshot_329](https://user-images.githubusercontent.com/123692654/216741401-8b8e34e9-d064-48f1-a12e-532246673959.png)
![Screenshot_330](https://user-images.githubusercontent.com/123692654/216741403-37e3b456-a15f-42d1-b7c3-6635ecd630d8.png)
![Screenshot_331](https://user-images.githubusercontent.com/123692654/216741404-a8f7cc2c-3876-4908-ac71-2d1bdfab9b90.png)
![Screenshot_332](https://user-images.githubusercontent.com/123692654/216741405-18e31934-74e8-460e-b265-db0750522776.png)
![Screenshot_333](https://user-images.githubusercontent.com/123692654/216741406-e7cf006f-a04c-4c59-9214-e34f707f73a6.png)

