# Setup up the Linux Server on Linode

## Initial Steps

1. **Log into your Linode account**.
2. **Go to "Linodes >> Create Linode"**.
3. **Choose an appropriate Linux distribution**.
4. **Select a Region which is close enough**.
5. **Select a Linode Plan** - always start with the cheapest one called "Nanode".
6. **Enter a label name for the virtual machine**.
7. **Create a strong password** - at least 25 characters long.

## SSH Configuration

### Local Machine Steps

1. **Generate an SSH Key**: Open a terminal and execute the following command, specifying a unique file name.
    ```bash
    ssh-keygen -t rsa -f ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```
2. **Display and Copy Public Key**: 
    ```bash
    cat ~/.ssh/<UNIQUE_VM_KEY_NAME>.pub
    ```
3. **Edit SSH Config**: Add a new entry for the VM in `~/.ssh/config`.
    ```text
    Host <VM_ALIAS>
        HostName <VM_IP_ADDRESS>
        User <USERNAME>
        IdentityFile ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```

### Linode Interface Steps

1. **Add SSH Key**: In the "Create a Linode" interface, click on "Add An SSH Key".
2. **Paste Public Key**: Paste the content of the public key, enter an appropriate Label Name, and click "Add Key".

## VM Configuration (Post-Creation)

1. **SSH as Root**: Initially connect as root.
    ```bash
    ssh root@<VM_IP_ADDRESS>
    ```
2. **Create Non-Root User**: 
    ```bash
    sudo adduser <USERNAME>
    sudo usermod -aG sudo <USERNAME>
    ```
3. **Disable Root SSH Access**: 
   ```
   sudo nano /etc/ssh/sshd_config
   ```
    Set `PermitRootLogin` to `no`.

5. **Restart SSH Service**: 
    ```bash
    sudo systemctl restart sshd
    ```

## Test Connection

1. **SSH into VM using the Non-Root User**: 
    ```bash
    ssh <VM_ALIAS>
    ```

By following these steps, you should now have a secure, SSH-enabled Linode VM.
