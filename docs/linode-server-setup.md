# Setup up the Linux Server on Linode

## Initial Steps

1. Log into your **Linode** account
2. Navigate to **Linodes** and click on **Create Linode**
3. Choose an appropriate **Linux** distribution
4. Select a **Region** which is as close as possible
5. Select the cheapest **Linode Plan** "Nanode"
6. Enter a **Label** name for the virtual machine
7. Create a **Strong Password** (at least **25** characters long) and store it inside a **Password Manager**

## SSH Configuration

### Local Machine Steps

1. **Generate an SSH Key**\
   Open a **Linux** terminal and execute the following command, specifying a **unique** file name:\
   _For **Production** environments enter a **Strong Passphrase** and store it inside a **Password Manager**_
    ```
    ssh-keygen -t rsa -f ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```
    
3. Add **new VM** settings inside **SSH Config**\
    Edit the `~/.ssh/config` file:
    ```
    nano ~/.ssh/config
    ```
    Add a new entry for the VM in `~/.ssh/config`:   
    ```
    Host <VM_ALIAS>
        HostName <VM_IP_ADDRESS>
        User <VM_USERNAME>
        IdentityFile ~/.ssh/<UNIQUE_VM_KEY_NAME>
    ```
    Press **Ctrl + O** to save\
    Press **Ctrl + X** to exit

5. Display and Copy the **Public SSH Key**: 
    ```
    cat ~/.ssh/<UNIQUE_VM_KEY_NAME>.pub
    ```

### Linode Interface Steps

1. **Add SSH Key**: In the "Create a Linode" interface, click on "Add An SSH Key".
2. **Paste Public Key**: Paste the content of the public key, enter an appropriate Label Name, and click "Add Key".

## VM Configuration (Post-Creation)

1. **SSH as Root**: Initially connect as root.
    ```
    ssh root@<VM_IP_ADDRESS>
    ```
2. **Create Non-Root User**: 
    ```
    sudo adduser <USERNAME>
    sudo usermod -aG sudo <USERNAME>
    ```
3. **Disable Root SSH Access**: 
   ```
   sudo nano /etc/ssh/sshd_config
   ```
    Set `PermitRootLogin` to `no`

5. **Restart SSH Service**: 
    ```
    sudo systemctl restart sshd
    ```

## Test Connection

1. **SSH into VM using the Non-Root User**: 
    ```
    ssh <VM_ALIAS>
    ```

By following these steps, you should now have a secure, SSH-enabled Linode VM.
