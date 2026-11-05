FROM python:3.12-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends git openssh-client \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    "ansible-core==2.19.*" \
    ansible-pylibssh \
    ansible-lint==26.10.1 \
    yamllint==1.38.0

RUN ansible-galaxy collection install \
    ansible.netcommon:8.4.0 \
    ansible.utils:6.0.1 \
    cisco.ios:11.3.0 \
    -p /usr/share/ansible/collections
