# Getting Started with AI Agents Docker Automation

## 🚀 Quick Start (5 Minutes)

If you already have Docker installed:

```bash
git clone https://github.com/Im044/ai-agents-docker-automation
cd ai-agents-docker-automation
cp .env.example .env
# Edit .env with your API keys
docker-compose up -d
```

---

## 📋 Prerequisites - Install Docker First

### What is Docker?
Docker is a tool that runs your AI agents in isolated containers. Think of it as a virtual machine, but lighter and faster!

### For Windows Users:

**Step 1:** Download Docker Desktop
- Go to https://www.docker.com/products/docker-desktop
- Click "Download for Windows"
- Run the installer
- Check "WSL 2" option during installation
- Restart your computer

**Step 2:** Verify installation
- Open PowerShell or Command Prompt
- Type: `docker --version`
- You should see a version number like "Docker version 24.0.0"

### For Mac Users:

**Step 1:** Download Docker Desktop
- Go to https://www.docker.com/products/docker-desktop
- Choose "Apple Silicon" if you have M1/M2/M3 Mac, else "Intel"
- Double-click the .dmg file
- Drag Docker to Applications folder

**Step 2:** Launch Docker
- Open Applications > Docker.app
- Wait for Docker to start (you'll see a menu bar icon)

**Step 3:** Verify installation
- Open Terminal
- Type: `docker --version`

### For Linux Users (Ubuntu/Debian):

```bash
# Update package list
sudo apt-get update

# Install Docker
sudo apt-get install docker.io docker-compose -y

# Add your user to docker group (so you don't need sudo)
sudo usermod -aG docker $USER

# Apply group changes
newgrp docker

# Verify
docker --version
```

---

## 📦 Step-by-Step Deployment

### Step 1: Clone the Repository

```bash
git clone https://github.com/Im044/ai-agents-docker-automation
cd ai-agents-docker-automation
```

**What this does:** Downloads all Docker configuration files to your computer.

### Step 2: Set Up Your API Keys

```bash
# Copy the example file
cp .env.example .env
```

Now edit the `.env` file:
- Open it in any text editor (Notepad, VS Code, etc.)
- Add your API keys:
  - Get OpenAI API key from https://platform.openai.com/api-keys
  - Get Anthropic API key from https://console.anthropic.com

Example `.env` file:
```
OPENAI_API_KEY=sk-abc123xyz...
ANTHROPIC_API_KEY=sk-ant-abc123xyz...
LOG_LEVEL=INFO
DEBUG_MODE=false
```

### Step 3: Start All AI Agents

```bash
# Start all agents in background
docker-compose up -d
```

You should see output like:
```
Creating network "ai-agents-docker-automation_ai-agents-network" with driver "bridge"
Building ai-content-creator-agent
Creating content-creator-agent ... done
Creating data-analyst-agent ... done
Creating research-agent ... done
Creating code-assistant-agent ... done
Creating sales-marketing-agent ... done
```

### Step 4: Check if Everything is Running

```bash
# See all running containers
docker-compose ps
```

You should see:
```
NAME                       STATUS
content-creator-agent      Up (healthy)
data-analyst-agent         Up (healthy)
research-agent             Up (healthy)
code-assistant-agent       Up (healthy)
sales-marketing-agent      Up (healthy)
```

### Step 5: Access Your Agents

Open these URLs in your browser:
- **Content Creator:** http://localhost:8001
- **Data Analyst:** http://localhost:8002
- **Research Agent:** http://localhost:8003
- **Code Assistant:** http://localhost:8004
- **Sales/Marketing:** http://localhost:8005

---

## 🛠️ Common Commands

### View Real-Time Logs
```bash
# View logs from all agents
docker-compose logs -f

# View logs from specific agent
docker-compose logs -f content-creator-agent
```

### Stop All Agents
```bash
# Stop without deleting
docker-compose stop

# Stop and remove (completely delete)
docker-compose down
```

### Restart Agents
```bash
# Restart all
docker-compose restart

# Restart specific agent
docker-compose restart content-creator-agent
```

### View Running Containers
```bash
docker ps
```

### Access Agent Terminal
```bash
# Connect to running agent
docker exec -it content-creator-agent bash

# Type 'exit' to disconnect
```

### Rebuild All Images
```bash
# Full rebuild (use if you update code)
docker-compose build --no-cache
```

---

## 📊 Project Structure

```
ai-agents-docker-automation/
├── GETTING_STARTED.md          # This file
├── docker-compose.yml          # Configuration for all agents
├── .env.example                # Template for API keys
├── setup.sh                    # Automated setup script
├── install-docker.md           # Detailed Docker installation
├── agents/
│   ├── content-creator/        # Content Creator Agent files
│   ├── data-analyst/           # Data Analyst Agent files
│   ├── research/               # Research Agent files
│   ├── code-assistant/         # Code Assistant Agent files
│   └── sales-marketing/        # Sales/Marketing Agent files
├── data/                       # Agent data storage
│   ├── content-creator/
│   ├── analyst/
│   ├── research/
│   ├── code-assistant/
│   └── sales-marketing/
└── logs/                       # Agent logs
```

---

## ⚠️ Troubleshooting

### Issue: "docker: command not found"
**Solution:**
- Make sure Docker is installed correctly
- Restart your computer
- Try opening Docker Desktop (Windows/Mac)

### Issue: "Permission denied while trying to connect to Docker daemon"
**Solution (Linux):**
```bash
sudo usermod -aG docker $USER
logout and login again
```

### Issue: Port already in use (e.g., port 8001)
**Solution:** Edit `docker-compose.yml` and change port numbers:
```yaml
ai-content-creator-agent:
  ports:
    - "9001:8000"  # Changed from 8001 to 9001
```

### Issue: Agents not starting / containers exit
**Solution:** Check logs
```bash
docker-compose logs
```

### Issue: Out of disk space
**Solution:** Clean up Docker
```bash
docker system prune -a
```

---

## 🎓 Learning Resources

- **Docker Official Docs:** https://docs.docker.com/
- **Docker Compose Guide:** https://docs.docker.com/compose/
- **AI Agents Documentation:** See individual agent repositories

---

## 📞 Need Help?

If something doesn't work:
1. Check the troubleshooting section above
2. View logs: `docker-compose logs`
3. Make sure Docker is running
4. Try rebuilding: `docker-compose build --no-cache`

---

## ✅ Next Steps

1. ✓ Install Docker
2. ✓ Clone this repository
3. ✓ Configure .env file with API keys
4. ✓ Run `docker-compose up -d`
5. → Access your agents at the URLs above!

Happy AI agent development! 🎉
