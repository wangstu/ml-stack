#!/bin/bash

ROOT_BIN_PATH=/ml-stack-init/usr/bin

$ROOT_BIN_PATH/mkdir -p /root/.ssh /run/sshd /var/empty
$ROOT_BIN_PATH/chown root /var/empty
$ROOT_BIN_PATH/echo "sshd:x:74:74::/run/sshd:" >> /etc/passwd
$ROOT_BIN_PATH/cat /proc/1/environ | $ROOT_BIN_PATH/tr '\0' '\n' > /root/.ssh/environment
$ROOT_BIN_PATH/mkdir -p /etc/ssh
$ROOT_BIN_PATH/ssh-keygen -A

if [ -n "${SSH_PUBLIC_KEY}" ]; then
  echo -e ${SSH_PUBLIC_KEY} > /root/.ssh/authorized_keys
fi

if [ -n "${SSH_ROOT_PASSWORD}" ]; then
  echo "root:${SSH_ROOT_PASSWORD}" | chpasswd
fi

$ROOT_BIN_PATH/sshd -D -f /ml-stack-init/ssh/sshd_config
$ROOT_BIN_PATH/tail -f /dev/null
