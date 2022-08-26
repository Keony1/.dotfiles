#!/bin/bash
# chmod 400 ~/.ssh/*
eval "$(ssh-agent -s)"
# ssh-add $(find ~/.ssh/ -type f | grep -vE ".*\.pub$" | grep -vE "known_hosts" | grep -vE "config")
ssh-add ~/.ssh/github
ssh-add ~/.ssh/gitlab
ssh-add ~/.ssh/azure

