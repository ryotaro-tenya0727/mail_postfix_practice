# Use the latest Ubuntu image as the base image
FROM ubuntu:latest

# Update the package list and install postfix, wget, curl, and vim
RUN apt-get update && \
    apt-get install -y postfix ufw wget curl vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/skel/Maildir/cur /etc/skel/Maildir/new /etc/skel/Maildir/tmp
RUN useradd -m goro
