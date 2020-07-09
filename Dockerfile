#!/usr/bin/docker
#
#  _____             _                 __          ___      __  ___  
# |  __ \           | |                \ \        / (_)    /_ |/ _ \ 
# | |  | | ___   ___| | _____ _ __ _____\ \  /\  / / _ _ __ | | | | |
# | |  | |/ _ \ / __| |/ / _ \ '__|______\ \/  \/ / | | '_ \| | | | |
# | |__| | (_) | (__|   <  __/ |          \  /\  /  | | | | | | |_| |
# |_____/ \___/ \___|_|\_\___|_|           \/  \/   |_|_| |_|_|\___/ 
#                                                                    
#                                                                    
# Repository:       https://github.com/dotMatthew/Docker-Win10
# Title:            Windows in a Docker Container
# Author:           dotMathew (https://dotmatthew.dev)
# Version:          1.0-PRE-ALPHA
# Licensee:         MIT License
#

# Main image (not the smallest but i like it xd ~md)
FROM debian:latest

ARG qemu_system_arch="x86_64"
ARG size="100G"

LABEL MAINTAINER="Mathias Dollenbacher <hello@mdollenbacher.net>"

# Update the system and install some software
RUN apt-get update -y && \
    apt-get upgrade -y \
    apt-get install x11-apps \
    qemu-system qemu-system-${qemu_system_arch} \
    ssh curl wget -y

# Enable SSH for the main container
RUN sed s/#PermitRootLogin/PermitRootLogin/g /etc/ssh/sshd_config | tee /etc/ssh/sshd_config

