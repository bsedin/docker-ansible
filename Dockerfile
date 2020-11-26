# original: https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile

FROM alpine:latest

RUN echo "===> Adding Python runtime..."  && \
    apk add --no-cache py3-pip openssl ca-certificates sshpass openssh-client git curl && \
    apk add --no-cache --virtual build-dependencies \
      python3-dev libffi-dev openssl-dev build-base  && \
    \
    pip3 install --upgrade pip && \
    \
    echo "===> Installing Ansible..."  && \
    pip3 install "ansible<2.10" ansible-lint     && \
    \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*

RUN mkdir /ansible

WORKDIR /ansible

CMD ["/usr/bin/ansible-playbook", "--version"]
