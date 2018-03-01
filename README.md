# terraform-openstack

Create multiple instances with floating ip assigning on openstack using terraform.

# Usage
Edit variables.tf :
   - project_name : The name of the Tenant/Project.
   - username : The username for the OpenStack.
   - password : The password for the OpenStack user.
   - auth_url : The endpoint url to connect to OpenStack.
   - network : The network to be used.
   - zone_name : The Availablity Zone name.

Edit deploy.tf : 
   - count : Number of instances to be created.
   - name : The instance names following a number. 
   - image_name : The image to be used. 
   - flavor_id : Your flavor uuid. 
   - security_groups : The security group to be used. 
   - user_data : Provision script. 
   - pool : The pool name to be used. 

Install the openstack provider plugin : 
```sh
terraform init
```
Check the plan :
```sh 
terraform plan
```
apply changes : 
```
terraform apply 
```

### Development

Want to contribute? Great! feel free to open PR 
