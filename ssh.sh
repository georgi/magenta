#!/bin/bash

echo ==================================================================
echo IP: $PS_HOST_PUBLIC_IP_ADDRESS
echo ==================================================================

apt-get update && apt-get install -y openssh-server
mkdir /var/run/sshd
mkdir /root/.ssh

cat > /root/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnZEGOLVAGWx0GVqfx6iYJhmg2Exx/wAHiGXk8SZbn+uc5nwrHe+wlHfLxKy7Ld2lPFdO748xNIPkKsE3/d2YpepM1VUPfKJx3VUvY7L0tJUo6CHDXsZ6eQRqyRqk0NYg+MrM093R359QLIhqlUPq5jOtXg9236FBeWLkXOsUFvri1xHcYsu3LkJTWAg33QosFffQ4JexI0Zsf2VgmhPP/Gv3F6ky5R938AoRAi9WD5ojHllpuPqs496z56QGS5KH5jpOLpmx0WQfS0Q0LGhP4Ekpr8S7NdE4dbitZo7OP/qRkOiHiEU3fI4Jc1vJFBma0W7mWpbJ/c3Ngsf5OE0NwQ==
EOF

sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

echo "export VISIBLE=now" >> /etc/profile

/usr/sbin/sshd -D