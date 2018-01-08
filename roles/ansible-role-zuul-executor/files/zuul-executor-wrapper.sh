#!/bin/bash

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < /etc/passwd.template > /etc/passwd_zuul
export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD=/etc/passwd_zuul
export NSS_WRAPPER_GROUP=/etc/group

scl enable rh-python35 "zuul-executor -d"
