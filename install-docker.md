# Docker Installation Guide

A beginner-friendly guide to install Docker and Docker Compose for AI Agents automation.

## Table of Contents
- [System Requirements](#system-requirements)
- [Windows Installation](#windows-installation)
- [Mac Installation](#mac-installation)
- [Linux Installation](#linux-installation)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## System Requirements

### Minimum Requirements
- **CPU**: Dual-core processor or better
- **RAM**: 4GB minimum (8GB recommended)
- **Disk Space**: 20GB free space
- **Internet**: Stable connection for downloads

### Network Requirements
- Port 8000-8100 available for services
- Docker Hub access (or private registry)

## Windows Installation

### Step 1: Download Docker Desktop
1. Visit [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)
2. Click "Download for Windows"
3. Select the appropriate version:
   - **Docker Desktop for Windows (Standard)**: For Windows 10/11 Pro, Enterprise, or Education
   - **Docker Desktop for Windows (Home)**: For Windows 10/11 Home

### Step 2: Install Docker Desktop
1. Run the downloaded `.exe` file
2. Follow the installation wizard
3. Check "Install required Windows components for WSL 2" if prompted
4. Complete the installation
5. Restart your computer when prompted

### Step 3: Configure Docker
1. Launch Docker Desktop from the Start menu
2. Sign in with your Docker account (or create one free at hub.docker.com)
3. Docker will start the daemon

### Step 4: Verify Installation
```bash
docker --version
docker run hello-world
```

## Mac Installation

### Step 1: Download Docker Desktop for Mac
1. Visit [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
2. Click "Download for Mac"
3. Choose based on your processor:
   - **Apple Silicon (M1/M2/M3)**: Docker for Mac with Apple Silicon
   - **Intel**: Docker for Mac with Intel Chip

### Step 2: Install Docker Desktop
1. Open the downloaded `.dmg` file
2. Drag Docker.app to the Applications folder
3. Wait for the copy process to complete
4. Eject the disk image

### Step 3: Launch Docker
1. Open Applications folder
2. Double-click Docker.app
3. Enter your password when prompted
4. Wait for Docker to start

### Step 4: Verify Installation
```bash
docker --version
docker run hello-world
```

## Linux Installation

### Ubuntu/Debian

#### Step 1: Update Package Manager
```bash
sudo apt update
sudo apt upgrade -y
```

#### Step 2: Install Prerequisites
```bash
sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
```

#### Step 3: Add Docker Repository
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### Step 4: Install Docker
```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

#### Step 5: Add Current User to Docker Group
```bash
sudo usermod -aG docker $USER
su - $USER
```

#### Step 6: Verify Installation
```bash
docker --version
docker run hello-world
```

### CentOS/RHEL

#### Step 1: Install Docker
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

#### Step 2: Start Docker Service
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

#### Step 3: Add User to Docker Group
```bash
sudo usermod -aG docker $USER
su - $USER
```

#### Step 4: Verify
```bash
docker --version
docker run hello-world
```

## Docker Compose Installation

### For Windows and Mac
Docker Compose is included with Docker Desktop. No additional installation needed.

Verify:
```bash
docker-compose --version
```

### For Linux
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

## Verification

Run these commands to ensure everything is installed correctly:

```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker-compose --version

# Test Docker installation
docker run hello-world

# Check Docker images
docker images

# Check Docker containers
docker ps -a
```

## Troubleshooting

### Windows Issues

**Issue**: Docker Desktop won't start
- Solution: Ensure WSL 2 is installed and updated
  ```bash
  wsl --update
  ```

**Issue**: Port conflicts
- Solution: Check which ports are in use
  ```bash
  netstat -ano | findstr :8000
  ```

### Mac Issues

**Issue**: Docker Desktop requires password repeatedly
- Solution: Update Docker Desktop to the latest version

**Issue**: Out of disk space
- Solution: Prune Docker resources
  ```bash
  docker system prune -a
  ```

### Linux Issues

**Issue**: Permission denied while connecting to Docker daemon
- Solution: Add user to docker group and restart
  ```bash
  sudo usermod -aG docker $USER
  newgrp docker
  ```

**Issue**: Docker service won't start
- Solution: Check service status and restart
  ```bash
  sudo systemctl status docker
  sudo systemctl restart docker
  ```

## Post-Installation Steps

1. **Verify Installation**
   ```bash
   docker run hello-world
   ```

2. **Pull Required Images**
   - Images will be downloaded automatically when containers start

3. **Configure Docker Settings**
   - Docker Desktop → Preferences → Resources
   - Allocate sufficient RAM and CPU cores
   - Set appropriate disk space

4. **Test with AI Agents**
   ```bash
   cd ai-agents-docker-automation
   bash setup.sh
   ```

## Additional Resources

- [Official Docker Documentation](https://docs.docker.com/)
- [Docker Getting Started Guide](https://docs.docker.com/get-started/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

## Support

For issues or questions:
1. Check Docker logs: `docker logs [container-name]`
2. Consult official documentation
3. Check the repository issues section
4. Review GETTING_STARTED.md for AI agents specific help

---

**Note**: Make sure you have administrator privileges for installation on Windows and Mac systems.
