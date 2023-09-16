#To use base os from container Image: Dockerfile Keyword: FROM
FROM centos:7
# To run OS Specific command: Dockerfile keyword: RUN
#Installing OpenSSH-server
RUN yum install openssh-server -y
# Configure SSH Server for password authentication
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
#Generating Keys
RUN ssh-keygen -A
#Changing the Password of the root user
# RUN echo "user_name:password" | chpasswd
RUN echo "root:centos" | chpasswd
#To start service at runtime
CMD ["/usr/sbin/sshd", "-D"]

