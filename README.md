<<<<<<< HEAD:README
It's better to run tempest on didicated VM inside you Openstack deployment
We created docker parent image with Tempest and prerequisites. It located in  ykisialiou/tempest-parent repo. 
Tempest has quite large and complicated config, used for all test sets, unfortunately it is full of sensitive
data (such as API accessing user with credentials). So, it’s would be better to configure  a lot of options on 
your side (users credentials, network options, openstack components and features, used on your installation).  
tempest.config is self documented and most of options described well. We also provide you config from our testing 
environment, maybe it will be useful. 

The testing process will consist of several steps on your side:


1) Fill necessary options in tempest.conf;
2) Create working directory and put tempest.conf there;
3) Put tempest-run.Dockerfile to working directory;
4) Build docker image with smth like
sudo docker build --file tempest-run.Dockerfile -t yourrepo/tempest-run .
5) Run docker image  by executing smth like
sudo docker run yourrepo/tempest-run > testing_results
6) Sent us testing_results file
=======
# Acceptance tests for OpenStack

### Description

This repo contains Dockerfile to build and run a simple set of acceptance tests for OpenStack. This projects uses modified smoke tests of [openstack/tempest](https://github.com/openstack/tempest) project.
>>>>>>> 7c39b44a04289aacc391f22169b4a40f15ce8264:README.md

### Pre-words

We created docker parent image with Tempest and prerequisites. It located in  [ykisialiou/tempest-parent](https://registry.hub.docker.com/u/ykisialiou/tempest-parent/) repo. Tempest has quite large and complicated config, used for all test sets, unfortunately it is full of sensitive data (such as API accessing user with credentials). So, it’s would be better to configure  a lot of options on your side (users credentials, network options, openstack components and features, used on your installation).  tempest.config is self documented and most of options described well. We also provide you config from our testing environment, maybe it will be useful. 

### How to run

The testing process will consist of several steps on your side:

1. Clone this repo: `git clone https://github.com/Ykisialiou/tempest-docker.git`.
1. Fill necessary options in `tempest.conf`. You can find some notes bellow.
1. Build docker image: `sudo docker build -t openstack-tests .`
1. Run docker image: `sudo docker run openstack-tests > testing_results`

`testing_results` file is a result of test envokation.

If you look at testing_results file and see errors, it is not necessary you Openstack problems. Sometimes it may be connected with  tempest misconfiguration or bugs.

### Configuration options notes

<<<<<<< HEAD:README
                       Some tempest configuration options notes
                       
=======
>>>>>>> 7c39b44a04289aacc391f22169b4a40f15ce8264:README.md
Options, which should be paid attention to is located below corresponding sections. 
```
[service_available] section

cinder
neutron
glance
swift
nova

bool options to describe components, you are using in you install. true if component set up and should be tested


[identity] section

uri
username
tenant_name
admin_role
password
alt_username
alt_tenant_name
alt_password
admin_username
admin_tenant_name
admin_password

uri - api endpoint URI in form https://10.10.10.10/v2/5000

other options  - credentials and tennants for users, having nova API access and Keystone access


[compute] section

image_ref
flavor_ref 
image_ssh_user
image_ssh_password
ssh_auth_method
ssh_connect_method

references to images and flavours for test vm, which will be created and then deleted. 
network options for ssh connections to hosts

[network] section
tenant_network_cidr 
tenant_network_mask_bits 
public_network_id
floating_network_name

internal and floating IP networks names and IDs
```
