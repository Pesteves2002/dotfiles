#!/bin/bash

# Remove config.ini from /etc/ly
sudo rm /etc/ly/config.ini

# Link config.ini to /etc/ly
sudo ln -s /home/$(whoami)/dotfiles/ly/config.ini /etc/ly/config.ini
