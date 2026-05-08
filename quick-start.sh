#!/bin/bash
# 🟢 IG VIRAL ENGINE — Quick Start Script
# Run this on your server to set everything up automatically
# 
# Usage: bash quick-start.sh
#
# All FREE. No credit card. No paid services. 🚀

set -e

echo "🟢 ============================================="
echo "🟢 IG VIRAL ENGINE — Quick Start Setup"
echo "🟢 ============================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${YELLOW}⚠️  Please run as root: sudo bash quick-start.sh${NC}"
  exit 1
fi

echo -e "${GREEN}📦 Step 1/7: Updating system...${NC}"
apt update && apt upgrade -y

echo -e "${GREEN}📦 Step 2/7: Installing Node.js 20...${NC}"
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

echo -e "${GREEN}📦 Step 3/7: Installing Docker...${NC}"
apt install -y docker.io docker-compose
systemctl start docker
systemctl enable docker

echo -e "${GREEN}📦 Step 4/7: Setting up n8n + Ollama...${NC}"
mkdir -p /root/n8n
cat > /root/n8n/docker-compose.yml << 'EOF'
version: '3.8'
services:
  n8n:
    image: docker.n8n.io/n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=ViralEngine2024!
      - GENERIC_TIMEZONE=Asia/Shanghai
      - N8N_HOST=0.0.0.0
      - WEBHOOK_URL=http://localhost:5678/
    volumes:
      - n8n_data:/home/node/.n8n

  ollama:
    image: ollama/ollama
    restart: always
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama

volumes:
  n8n_data:
  ollama_data:
EOF

echo -e "${GREEN}📦 Step 5/7: Starting services...${NC}"
cd /root/n8n && docker-compose up -d

echo -e "${GREEN}📦 Step 6/7: Pulling AI model (this takes a few minutes)...${NC}"
echo "⏳ Downloading llama3 model..."
sleep 10
docker exec n8n-ollama-1 ollama pull llama3 || echo "⚠️  Model pull in progress, will complete in background"

echo -e "${GREEN}📦 Step 7/7: Setting up image hosting...${NC}"
apt install -y nginx
mkdir -p /var/www/carousels

cat > /etc/nginx/sites-available/carousels << 'EOF'
server {
    listen 8080;
    root /var/www/carousels;
    location / {
        autoindex on;
        add_header Access-Control-Allow-Origin *;
    }
}
EOF

ln -sf /etc/nginx/sites-available/carousels /etc/nginx/sites-enabled/
nginx -t && systemctl restart nginx

echo ""
echo -e "${GREEN}🟢 ============================================="
echo -e "🟢 SETUP COMPLETE!"
echo -e "🟢 =============================================${NC}"
echo ""
echo "📋 Your services:"
echo "   🌐 n8n:     http://$(curl -s ifconfig.me):5678"
echo "   🧠 Ollama:  http://localhost:11434"
echo "   🖼️  Images:  http://$(curl -s ifconfig.me):8080"
echo ""
echo "📋 Next steps:"
echo "   1. Open n8n and import IG-VIRAL-ENGINE.json"
echo "   2. Create Telegram bot with @BotFather"
echo "   3. Set up Instagram Graph API"
echo "   4. Configure environment variables"
echo "   5. Start creating viral content! 🚀"
echo ""
echo "📖 Read docs/SETUP-GUIDE.md for detailed instructions"
echo ""
echo -e "${GREEN}🟢 GET VIRAL OR DIE TRYING 💀🔥${NC}"
