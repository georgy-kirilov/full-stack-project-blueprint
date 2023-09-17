# Set Up the Linux Server on Linode

## Placeholder Explanations

### **!Placeholders should be stored in a Password Manager!**

- `<USERNAME>`: The non-root user on the VM.
    - e.g. value: `bluespiderman31`
    - Description: The name should be non-trivial to prevent security vulnerabilities.

- `<VM_NAME>`: Used for VM label names, SSH key files and other configurations
    - e.g. value: `my-cool-project-vm`

## Initial Steps

1. **Log into your Linode account**
2. **Navigate to Linodes** and click on "Create Linode"
3. **Choose an appropriate Linux distribution**
4. **Select a Region** that is as close as possible
5. **Select the Linode Plan** - Choose the cheapest option, "Nanode"
6. **Enter a Label Name**: Use `<VM_NAME>`
7. **Create a Strong Password**: Make it at least 25 characters long and store it in a Password Manager

## SSH Configuration

### Local Machine Steps

1. **Generate an SSH Key**: 
    ```bash
    ssh-keygen -t rsa -f ~/.ssh/<VM_NAME>
    ```

2. **Display and Copy Public SSH Key**: 
    ```bash
    cat ~/.ssh/<VM_NAME>.pub
    ```

### Linode Interface Steps

1. **Add SSH Key**: 
2. **Paste Public Key**: Use `<VM_NAME>` as the label, then click "Add Key"
3. **Create Linode**

### Post-Creation Local Machine Steps

1. **Get VM's IP Address**
  
2. **Edit SSH Config**: 
    ```bash
    nano ~/.ssh/config
    ```
    Add the entry:
    ```text
    Host <VM_NAME>
        HostName <VM_IP_ADDRESS>
        User <USERNAME>
        IdentityFile ~/.ssh/<VM_NAME>
    ```

## VM Configuration (Post-Creation)

1. **SSH as Root**: 
    ```bash
    ssh root@<VM_IP_ADDRESS>
    ```

2. **Create Non-Root User**: 
    ```bash
    sudo adduser <USERNAME>
    sudo usermod -aG sudo <USERNAME>
    ```

3. **Setup SSH for Non-Root User**: 
    ```bash
    sudo mkdir -p /home/<USERNAME>/.ssh
    sudo nano /home/<USERNAME>/.ssh/authorized_keys
    ```
    Paste public SSH key content, save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

4. **Change Ownership and Permissions**: 
    ```bash
    sudo chown -R <USERNAME>:<USERNAME> /home/<USERNAME>/.ssh
    sudo chmod 700 /home/<USERNAME>/.ssh
    sudo chmod 600 /home/<USERNAME>/.ssh/authorized_keys
    ```

5. **Disable Root SSH Access**: 
    ```bash
    sudo nano /etc/ssh/sshd_config
    ```
    Set `PermitRootLogin` to `no`

6. **Restart SSH Service**: 
    ```bash
    sudo systemctl restart sshd
    ```

## Test Connection

SSH into VM using the non-root user:
```bash
ssh <VM_NAME>
