# Project Server Setup

This guide provides instructions on setting up custom servers using the provided commands. These commands will help configuring the necessary firewall rules, SSH ports, install essential software, and creating a new user (without access to shell). Please note that this setup is optimized for personal requirements and may not align with other use cases.

## Prerequisites

Before you begin, ensure you have:

- Access to a terminal with `bash` support.
- Administrative privileges on the server.

## Steps

1. **Allow Ports 9200 and 55642 in Firewall**

   Run the following commands to allow incoming traffic on ports 9200 and 55642:

   ```bash
   sudo ufw allow 9200/tcp
   sudo ufw allow 55642/tcp
   ```

2. **Update SSH Configuration**

   Add the custom SSH ports (9200 and 55642) to the SSH configuration file:

   ```bash
   sudo sed -i '16i\Port 9200' /etc/ssh/sshd_config
   sudo sed -i '16i\Port 55642' /etc/ssh/sshd_config
   ```

3. **Restart SSH Service**

   Restart the SSH service to apply the new configuration:

   ```bash
   sudo service ssh restart
   ```

4. **Update and Install Software**

   Update the package list and install necessary software (Nginx and Python3-pip):

   ```bash
   sudo apt update
   sudo apt install nginx
   sudo apt install python3-pip
   ```

5. **Allow Nginx HTTP Traffic**

   Allow incoming HTTP traffic through the firewall for Nginx:

   ```bash
   sudo ufw allow 'Nginx HTTP'
   ```

6. **Create New User**

   Create a new user with restricted shell access and no home directory:

   ```bash
   sudo adduser carl --shell=/bin/false --no-create-home
   ```
