## Quickstart

docker run -it \
  -v /some/ansible:/ansible \
  -v ~/.ssh/id_rsa:/id_rsa \
  kr3ssh/ansible:latest \
  ansible-playbook playbook.yml
