# Install and Configure Dependencies on a Linux VM

## Docker Installation

1. **Update Package Information**:  
    ```bash
    sudo apt update
    ```

2. **Install Docker**:  
    ```bash
    sudo apt install docker.io -y
    ```

3. **Enable Docker**:  
    ```bash
    sudo systemctl enable docker --now
    ```

## Docker-Compose Installation

1. **Download Docker-Compose**:  
    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

2. **Make Docker-Compose Executable**:  
    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```

## Firewall Configuration (UFW)

1. **Install UFW**:  
    ```bash
    sudo apt install ufw
    ```

2. **Allow SSH**:  
    ```bash
    sudo ufw allow ssh
    ```

3. **Enable Firewall**:  
    ```bash
    sudo ufw enable
    ```
    > **Note**: When prompted with "Command may disrupt existing ssh connections. Proceed with operation (y|n)?", type `y` and press "Enter".

4. **Allow Docker**:  
    ```bash
    sudo ufw allow in on docker0
    ```

5. **Reload Firewall**:  
    ```bash
    sudo ufw reload
    ```

6. **Check Firewall Status**:  
    ```bash
    sudo ufw status
    ```
