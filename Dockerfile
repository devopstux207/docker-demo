# 
FROM ubuntu:latest

RUN apt update && \
    apt install openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test  && \
    usermod -aG sudo test  && \
    service ssh start && \
    echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
