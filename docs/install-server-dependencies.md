# Install Required Dependencies on the Linux VM

## Important Warning

Before enabling the firewall (UFW), make sure you have set the firewall to allow SSH connections. Failing to do so might lock you out of your VM.

## Install Docker

1. **Update Package Information**: 
    ```bash
    sudo apt update
    ```

2. **Install Docker**:
    ```bash
    sudo apt install docker.io
    ```

3. **Enable and Start Docker Service**:
    ```bash
    sudo systemctl enable docker
    sudo systemctl start docker
    ```

4. **Add Non-Root User to Docker Group**:
    ```bash
    sudo usermod -aG docker <USERNAME>
    ```
    After this step, either log out and log back in, or run the following to apply the group changes:
    ```bash
    newgrp docker
    ```

## Install Docker-Compose

1. **Download Docker-Compose**:
    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

2. **Apply Executable Permissions**:
    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```

## Install and Configure Firewall (UFW)

1. **Install UFW**:
    ```bash
    sudo apt install ufw
    ```

2. **Allow SSH Through Firewall**:
    ```bash
    sudo ufw allow OpenSSH
    ```
    Make sure to run this command before enabling UFW to ensure you won't get disconnected.

3. **Enable UFW**:
    ```bash
    sudo ufw enable
    ```
    Answer 'y' when prompted.

4. **Allow Docker Through Firewall**:
    ```bash
    sudo ufw allow 2375,2376/tcp
    ```

5. **Reload Firewall**:
    ```bash
    sudo ufw reload
    ```

## Verify Installations

1. **Verify Docker Installation**:
    ```bash
    docker --version
    ```

2. **Verify Docker-Compose Installation**:
    ```bash
    docker-compose --version
    ```

3. **Verify Firewall Status**:
    ```bash
    sudo ufw status
    ```
