FROM ykisialiou/tempest-for-openstack:latest 

 
MAINTAINER Eugene Kiselev <yauheni.kisialiou@altoros.com>


#Copy config
 
COPY tempest.conf /tempest/tempest-master/etc/tempest.conf

# Run tests 

CMD ["/tempest/tempest-master/run_tempest.sh", "-sV"]
