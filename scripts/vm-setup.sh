echo ""
echo "=== Create VM on Linode ==="
echo ""

read -p "1. Enter VM name: " VM_NAME
echo ""

read -p "2. Enter VM non-root user name: " USERNAME
echo ""

echo "=== Create a new Linode VM ==="
echo ""

read -p "1. Log into Linode, go to 'Linodes' and click on 'Create Linode'..."
echo ""

read -p "2. Choose a Distribution (e.g. Ubuntu LTS)..."
echo

read -p "3. Choose a Region (e.g. Frankfurt, DE)..."
echo

read -p "4. Choose a Linode Plan (e.g. Nanode 1 GB)..."
echo

read -p "5. Fill in a Linode Label (use '$VM_NAME')..."
echo

read -p "6. Fill in a strong Root Password (at least 25 characters long)..."
echo

read -p "7. Open a new Linux terminal on your local machine..."
echo

read -p "8. Generate an SSH Key pair:
ssh-keygen -t rsa -f ~/.ssh/$VM_NAME"
echo

read -p "9. Display the Public SSH Key:
cat ~/.ssh/$VM_NAME.pub"
echo

read -p "10. Copy the entire displayed content to clipboard..."
echo

read -p "11. In the Linode UI click on 'Add An SSH Key'..."
echo

read -p "12. Paste the copied Public SSH Key and fill in a Label (use '$VM_NAME')..."
echo

read -p "13. Click on 'Add Key', review your Linode configurations and click on 'Create Linode'..."
echo

read -p "14. Once the new VM is created, copy its IP address from the dashboard and paste it here: " VM_IP_ADDRESS
echo

echo "=== Configure VM SSH connections ==="
echo

read -p "1. In your local Linux terminal open the SSH settings file:
nano ~/.ssh/config"
echo

read -p "2. Copy the following configuration and paste it inside ~/.ssh/config:
Host $VM_NAME
    HostName $VM_IP_ADDRESS
    User $USERNAME
    IdentityFile ~/.ssh/$VM_NAME"
echo

read -p "3. Save the changes and exit nano (Ctrl + O, Enter, Ctrl + X)..."
echo

read -p "4. Open a new Linux terminal used for connecting to the VM..."
echo

read -p "5. SSH into the VM as the root user:
ssh root@$VM_IP_ADDRESS"
echo

read -p "6. Create a non-root user on the VM:
sudo adduser $USERNAME"
read -p "sudo usermod -aG sudo $USERNAME"
echo

read -p "7. Setup an SSH connection for the non-root user:
sudo mkdir -p /home/$USERNAME/.ssh"
read -p "sudo nano /home/$USERNAME/.ssh/authorized_keys"
echo

read -p "8. Go inside your local Linux terminal and display the content of the Public SSH Key:
cat ~/.ssh/$VM_NAME.pub"
echo

read -p "9. Copy the entire displayed content to clipboard..."
echo

read -p "10. Paste the copied Public SSH Key inside the opened 'authorized_keys' file..."
echo

read -p "11. Save the changes and exit nano (Ctrl + O, Enter, Ctrl + X)..."
echo

read -p "12. Change Ownership and Permissions:
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh"
read -p "sudo chmod 700 /home/$USERNAME/.ssh"
read -p "sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys"
echo

read -p "13. Disable root user SSH access by setting the 'PermitRootLogin' value to 'no':
sudo nano /etc/ssh/sshd_config"
echo

read -p "14. Save the changes and exit nano (Ctrl + O, Enter, Ctrl + X)..."
echo

read -p "15. Restart SSH service:
sudo systemctl restart sshd"
echo

read -p "16. Close the VM's Linux terminal to disconnect..."
echo

read -p "17. Open a new Linux terminal and SSH to the VM using the non-root user:
ssh $VM_NAME"
echo

echo "=== Install VM Dependencies ==="
echo

read -p "1. Update the package list:
sudo apt update"
echo

read -p "2. Install Docker:
sudo apt install docker.io"
echo

read -p "3. Enable Docker to start at boot:
sudo systemctl enable docker"
echo

read -p "4. Start the Docker service:
sudo systemctl start docker"
echo

read -p "5. Add the non-root user to Docker group:
sudo usermod -aG docker $USERNAME"
echo

read -p "6. Activate the changes to groups:
newgrp docker"
echo

read -p "7. Download and install Docker Compose:
sudo curl -L \"https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose"
echo

read -p "8. Make Docker Compose executable:
sudo chmod +x /usr/local/bin/docker-compose"
echo

read -p "9. Install Firewall:
sudo apt install ufw"
echo

read -p "10. Allow SSH connections through the Firewall:
sudo ufw allow OpenSSH"
echo

read -p "11. Enable the Firewall:
sudo ufw enable"
echo

read -p "10. Allow Docker ports on the Firewall:
sudo ufw allow 2375,2376/tcp"
echo

read -p "11. Reload Firewall to apply changes:
sudo ufw reload"
echo

read -p "12. Confirm Docker installation:
docker --version"
echo

read -p "13. Confirm Docker Compose installation:
docker-compose --version"
echo

read -p "14. Display Firewall status:
sudo ufw status"
echo

echo "Done."