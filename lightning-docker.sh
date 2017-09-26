#!/bin/bash
#Script is used to install docker and build a quick application as a demo
is_centos6()
{
    grep '^CentOS release 6.*$' /etc/centos-release >/dev/null 2>&1
}
is_centos7()
{
    grep '^ID=.centos.$' /etc/os-release >/dev/null 2>&1 && grep '^VERSION_ID=.7.*$' /etc/os-release >/dev/null 2>&1
}
is_rhel7()
{
    grep '^ID=.rhel.$' /etc/os-release >/dev/null 2>&1 && grep '^VERSION_ID=.7.*$' /etc/os-release >/dev/null 2>&1
}
is_ubuntu14()
{
    grep '^DISTRIB_ID=Ubuntu$' /etc/lsb-release >/dev/null 2>&1 && grep '^DISTRIB_CODENAME=trusty$' /etc/lsb-release >/dev/null 2>&1
}
is_ubuntu16()
{
    grep '^DISTRIB_ID=Ubuntu$' /etc/lsb-release >/dev/null 2>&1 && grep '^DISTRIB_CODENAME=xenial$' /etc/lsb-release >/dev/null 2>&1
}
if is_centos6 || is_ubuntu14 || is_ubuntu16
then
        echo -e "This course is designed for CentOS7 or Red Hat 7, Please use one of those distributions"
elif is_centos7 || is_rhel7
then
        /usr/bin/sudo /usr/bin/yum clean all
        /usr/bin/sudo /usr/bin/yum yum install -y yum-utils device-mapper-persistent-data lvm2
        /usr/bin/sudo /usr/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        /usr/bin/sudo /usr/bin/yum install -y docker-ce
        /usr/bin/sudo /bin/systemctl start docker
        /usr/bin/sudo /bin/docker docker pull cloudassessmentscom/fs-photos
        /usr/bin/sudo /bin/docker run -d -p 80:3000 cloudassessmentscom/fs-photos:latest
fi
