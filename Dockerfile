FROM centos:latest
MAINTAINER shokeen.akhil@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
        zip \
        unzip
COPY testapp.zip /var/www/html
#COPY /home/ec2-user/testapp.zip /var/www/html
WORKDIR /var/www/html
RUN unzip testapp.zip
RUN cp -rv testapp/* .
RUN rm -rf testapp.zip testapp
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
