# 🟢 IG VIRAL ENGINE — Complete Setup Guide
# Everything you need. Everything is FREE. Let's go! 🚀🔥

---

## 📋 WHAT YOU NEED (All Free)

| Tool | Purpose | Cost | Link |
|------|---------|------|------|
| n8n | Workflow automation | FREE (self-hosted) | https://n8n.io |
| Ollama | Local AI (LLM) | FREE | https://ollama.ai |
| Telegram Bot | Chat interface | FREE | https://t.me/BotFather |
| Instagram Graph API | Post to IG | FREE | https://developers.facebook.com |
| Puppeteer | Render carousels | FREE | https://pptr.dev |
| Node.js | Runtime | FREE | https://nodejs.org |
| A Server/VPS | Run everything | FREE (Oracle Cloud/Google Cloud free tier) | See below |

---

## 🖥️ STEP 1: Get a FREE Server

### Option A: Oracle Cloud Free Tier (RECOMMENDED) ☁️
1. Go to https://cloud.oracle.com/free
2. Create a free account (no credit card charge)
3. Launch an **ARM Ampere A1 instance** (4 cores, 24GB RAM — FREE FOREVER)
4. Install Ubuntu 22.04
5. Note your server's public IP address

### Option B: Google Cloud Free Tier ☁️
1. Go to https://cloud.google.com/free
2. Create account (get $300 free credit for 90 days)
3. Launch an e2-micro instance (free tier)
4. Install Ubuntu 22.04

### Option C: Your Own Computer/Laptop 💻
- Just install everything locally
- Only works when your computer is on
- Good for testing, not for 24/7 automation

---

## 🛠️ STEP 2: Install Everything on Your Server

SSH into your server and run these commands:

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Install Docker (for n8n)
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Log out and back in for docker group to take effect
exit
```

```bash
# After re-logging in:

# Create n8n directory
mkdir -p ~/n8n && cd ~/n8n

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
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
      - N8N_BASIC_AUTH_PASSWORD=YourSecurePassword123
      - GENERIC_TIMEZONE=Asia/Shanghai
      - N8N_HOST=0.0.0.0
      - WEBHOOK_URL=http://YOUR_SERVER_IP:5678/
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

# Start everything
docker-compose up -d

# Pull a good AI model (llama3 is free and powerful)
docker exec -it n8n-ollama-1 ollama pull llama3
docker exec -it n8n-ollama-1 ollama pull llama3:8b
```

### Install Puppeteer (for rendering carousels)
```bash
# Install Chrome dependencies
sudo apt install -y chromium-browser

# Or install Puppeteer globally
npm install -g puppeteer
```

---

## 📱 STEP 3: Create Telegram Bot (FREE)

1. Open Telegram, search for **@BotFather**
2. Send `/newbot`
3. Name your bot: `IG Viral Engine` (or whatever you want)
4. Username: `ig_viral_engine_bot` (must end in `bot`)
5. BotFather gives you a **BOT TOKEN** — save it! 📝
6. Send `/setcommands` to BotFather and paste:
```
start - Welcome message
niche - Set your niche
brand - Upload brand identity
research - Deep niche research
create - Generate carousel
post - Post to Instagram
analytics - View performance
report - Weekly report
monetize - Monetization tips
status - System status
help - Show all commands
```

### Get Your Chat ID
1. Send any message to your bot
2. Visit: `https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates`
3. Find your `chat.id` in the response — save it! 📝

---

## 📸 STEP 4: Set Up Instagram Graph API (FREE)

### Prerequisites:
- Instagram **Business** or **Creator** account (free to switch)
- Facebook Page connected to your IG account
- Facebook Developer account

### Setup Steps:

1. **Switch to Business/Creator Account:**
   - Instagram → Settings → Account → Switch to Professional Account
   - Choose a category
   - Connect to a Facebook Page (create one if needed)

2. **Create Facebook App:**
   - Go to https://developers.facebook.com/
   - Click "Create App"
   - Choose "Business" type
   - Fill in app name and email
   - Add "Instagram Graph API" product

3. **Get Access Token:**
   - Go to Graph API Explorer
   - Select your app
   - Click "Generate Access Token"
   - Grant permissions: `instagram_basic`, `instagram_content_publish`, `pages_show_list`, `pages_read_engagement`
   - Copy the token (expires in 1 hour — for production, extend it)

4. **Get Instagram User ID:**
   - GET request to: `https://graph.facebook.com/v18.0/me/accounts?access_token=YOUR_TOKEN`
   - Find your Page ID
   - GET request to: `https://graph.facebook.com/v18.0/PAGE_ID?fields=instagram_business_account&access_token=YOUR_TOKEN`
   - The `instagram_business_account.id` is your **IG User ID** 📝

5. **Extend Token (for long-term use):**
   - Use the Access Token Debugger: https://developers.facebook.com/tools/debug/accesstoken/
   - Click "Extend Access Token"
   - This gives you a ~60 day token
   - For permanent: set up token refresh in n8n

---

## 🌐 STEP 5: Set Up Image Hosting (FREE)

Instagram needs public URLs for images. Options:

### Option A: Use Your Server (Simplest)
```bash
# Install nginx
sudo apt install -y nginx

# Create directory for carousel images
sudo mkdir -p /var/www/carousels
sudo chown -R $USER:$USER /var/www/carousels

# Configure nginx
sudo tee /etc/nginx/sites-available/carousels << 'EOF'
server {
    listen 8080;
    root /var/www/carousels;
    location / {
        autoindex on;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/carousels /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx
```

### Option B: Use Cloudinary (FREE Tier)
- 25GB storage, 25GB bandwidth/month
- Sign up: https://cloudinary.com
- Get your cloud name, API key, API secret
- Images auto-hosted with CDN

---

## ⚙️ STEP 6: Configure n8n Environment Variables

In your n8n docker-compose.yml, add these environment variables:

```yaml
environment:
  # ... existing vars ...
  - TELEGRAM_BOT_TOKEN=your_bot_token_here
  - TELEGRAM_CHAT_ID=your_chat_id_here
  - IG_USER_ID=your_ig_user_id_here
  - IG_ACCESS_TOKEN=your_ig_access_token_here
  - PUBLIC_URL=http://YOUR_SERVER_IP:8080
```

Restart n8n:
```bash
cd ~/n8n && docker-compose down && docker-compose up -d
```

---

## 📥 STEP 7: Import the Workflow

1. Open n8n: `http://YOUR_SERVER_IP:5678`
2. Login with your credentials
3. Click **"Add Workflow"** (top right)
4. Click **"..."** menu → **"Import from File"**
5. Upload `IG-VIRAL-ENGINE.json`
6. The workflow loads with all nodes connected!

---

## 🔌 STEP 8: Connect the Nodes

After importing, you need to configure credentials:

### Telegram Credential:
1. Click any Telegram node
2. Click "Create New Credential"
3. Enter your Bot Token
4. Save

### Ollama Connection:
- Ollama should be running on `http://ollama:11434` (Docker internal)
- Or `http://localhost:11434` if running locally
- No credentials needed — it's local!

### Instagram Graph API:
- Already configured via environment variables
- Or add credentials manually in n8n

---

## 🧪 STEP 9: Test Everything

### Test 1: Telegram Bot
```
Send /start to your bot on Telegram
```
Expected: Welcome message with command list

### Test 2: Set Niche
```
Send /niche fitness for women over 30
```
Expected: Confirmation + research begins

### Test 3: Create Content
```
Send /create
```
Expected: AI generates a carousel preview

### Test 4: Check Status
```
Send /status
```
Expected: System status report

---

## 🎨 STEP 10: Upload Your Brand Identity

Send this to your bot:
```
/brand

My brand colors: #1a1a2e (dark bg), #e94560 (accent), #ffffff (text)
Font: Bold, modern sans-serif
Style: Clean, minimal, high contrast
Vibe: Professional but edgy
```

Or upload a sample carousel image and describe your style.

---

## 🔄 STEP 11: Set Up Auto-Posting (Optional)

To post automatically every 6 hours:

1. In n8n, find the "⏰ Scheduled Trigger" node
2. Click it and set the schedule:
   - Every 6 hours
   - Or specific times (e.g., 9am, 12pm, 6pm, 9pm)
3. Connect it to the Content Generator
4. Activate the workflow (toggle in top-right)

---

## 📊 STEP 12: Monitor & Optimize

### Daily:
- Check Telegram for performance updates
- Review which hooks are working
- Adjust strategy based on data

### Weekly:
- Run /report for full analytics
- Review top performing posts
- Update content strategy
- Research new trends

### Monthly:
- Review monetization readiness
- Update brand identity if needed
- Scale what's working, kill what's not

---

## 🚨 TROUBLESHOOTING

### Bot not responding?
```bash
# Check if n8n is running
docker ps

# Check n8n logs
docker logs n8n-n8n-1

# Restart everything
cd ~/n8n && docker-compose restart
```

### Ollama not working?
```bash
# Check if Ollama is running
docker ps | grep ollama

# Test Ollama
curl http://localhost:11434/api/tags

# Pull model again
docker exec -it n8n-ollama-1 ollama pull llama3
```

### Instagram posting failing?
- Check access token is valid
- Ensure IG account is Business/Creator
- Verify image URLs are publicly accessible
- Check IG API rate limits

### Carousels looking bad?
- Update the HTML template in the "🎨 HTML Carousel Renderer" node
- Adjust colors, fonts, spacing
- Test with different brand identities

---

## 💡 PRO TIPS

1. **Start with research** — Don't skip the research phase. Knowledge = power
2. **Post consistently** — 2-3 carousels per day minimum
3. **Test everything** — Every post is an experiment
4. **Engage with comments** — Reply to build community
5. **Save your best hooks** — Build a swipe file over time
6. **Monitor competitors** — Learn from their successes and failures
7. **Be patient** — Week 1-2 is research and testing. Week 3+ is when magic happens
8. **Go viral or die trying** 💀🔥

---

## 🎯 YOUR FIRST 7 DAYS

**Day 1:** Setup everything (server, n8n, Telegram, IG API)
**Day 2:** Set your niche, run deep research
**Day 3:** Upload brand identity, create first 3 carousels
**Day 4:** Post first carousel, monitor engagement
**Day 5:** Create 3 more carousels with different hooks
**Day 6:** A/B test — compare hook styles
**Day 7:** Review analytics, adjust strategy

**Week 2:** Double down on winners, increase posting frequency
**Week 3:** Start monetization planning
**Week 4:** Launch first product/affiliate

---

## 🔥 YOU'RE READY

The system is built. The engine is ready. Time to go viral. 💀🟢🔥

**GET VIRAL OR DIE TRYING.**
