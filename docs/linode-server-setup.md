# Set Up the Linux Server on Linode

## Initial Steps

1. **Log into your Linode account**
2. **Navigate to Linodes** and click on `Create Linode`
3. **Choose an appropriate Linux distribution**
4. **Select a Region** that is as close as possible
5. **Select the Linode Plan** - Choose the cheapest option, "Nanode"
6. **Enter a Label Name** for the virtual machine
7. **Create a Strong Password**: Make it at least 25 characters long and store it in a Password Manager

## SSH Configuration

### Local Machine Steps

1. **Generate an SSH Key**: Open a Linux terminal and execute the following command, specifying a unique filename:
    ```bash
    ssh-keygen -t rsa -f ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```

2. **Edit SSH Config**: Add a new entry for the VM in `~/.ssh/config`.
    ```text
    Host <VM_ALIAS>
        HostName <VM_IP_ADDRESS>
        User <USERNAME>
        IdentityFile ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```

3. **Display and Copy the Public SSH Key**:
    ```bash
    cat ~/.ssh/<UNIQUE_VM_KEY_NAME>.pub
    ```

### Linode Interface Steps

1. **Add SSH Key**: In the `Create a Linode` interface, click on "Add An SSH Key".
2. **Paste Public Key**: Paste the content of the public key, enter an appropriate label name, and click "Add Key".
3. **Click on "Create Linode"**.

## VM Configuration (Post-Creation)

1. **SSH as Root**: Initially connect as root:
    ```bash
    ssh root@<VM_IP_ADDRESS>
    ```

2. **Create Non-Root User**:
    ```bash
    sudo adduser <USERNAME>
    sudo usermod -aG sudo <USERNAME>
    ```

3. **Disable Root SSH Access**:
    ```bash
    sudo nano /etc/ssh/sshd_config
    ```
    Set `PermitRootLogin` to `no`.

4. **Restart SSH Service**:
    ```bash
    sudo systemctl restart sshd
    ```

## Test Connection

SSH into VM using the non-root user:

```bash
ssh <VM_ALIAS>
