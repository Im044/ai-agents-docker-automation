# Code Assistant AI Agent - Dockerfile
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential curl git && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY code_assistant_agent.py .

RUN useradd -m -u 1000 aiagent
USER aiagent

EXPOSE 8004
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:8004/health || exit 1
CMD ["python", "code_assistant_agent.py"]
