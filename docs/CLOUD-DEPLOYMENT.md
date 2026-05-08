# ☁️ FREE CLOUD DEPLOYMENT GUIDE
# Deploy IG Viral Engine to completely free cloud platforms

---

## 🏆 BEST OPTIONS (Ranked)

### 1. Render.com (EASIEST) ⭐⭐⭐⭐⭐
- **Free Tier:** Yes (750 hours/month)
- **Difficulty:** Super Easy
- **Steps:**
  1. Push code to GitHub (already done!)
  2. Go to https://render.com
  3. Sign up with GitHub
  4. Click "New" → "Web Service"
  5. Connect your GitHub repo
  6. Render auto-detects the Dockerfile
  7. Click "Create Web Service"
  8. Done! 🎉

- **Set Environment Variables:**
  - In Render dashboard → Environment
  - Add: `TELEGRAM_BOT_TOKEN`, `IG_ACCESS_TOKEN`, etc.

- **URL:** `https://ig-viral-engine.onrender.com`

---

### 2. Railway.app (BEST PERFORMANCE) ⭐⭐⭐⭐⭐
- **Free Tier:** $5 credit/month (enough for small apps)
- **Difficulty:** Easy
- **Steps:**
  1. Go to https://railway.app
  2. Sign up with GitHub
  3. Click "New Project" → "Deploy from GitHub Repo"
  4. Select your repo
  5. Railway auto-deploys!
  6. Add environment variables in Settings

- **URL:** `https://ig-viral-engine.up.railway.app`

---

### 3. Fly.io (MOST POWERFUL) ⭐⭐⭐⭐
- **Free Tier:** 3 shared-cpu-1x VMs, 3GB persistent storage
- **Difficulty:** Medium
- **Steps:**
  1. Install flyctl: `curl -L https://fly.io/install.sh | sh`
  2. Login: `fly auth login`
  3. Launch: `fly launch`
  4. Set secrets:
     ```bash
     fly secrets set TELEGRAM_BOT_TOKEN=your_token
     fly secrets set IG_ACCESS_TOKEN=your_token
     fly secrets set N8N_BASIC_AUTH_PASSWORD=your_password
     ```
  5. Deploy: `fly deploy`

- **URL:** `https://ig-viral-engine.fly.dev`

---

### 4. Oracle Cloud (BEST FOR 24/7) ⭐⭐⭐⭐⭐
- **Free Tier:** ALWAYS FREE (4 cores, 24GB RAM)
- **Difficulty:** Medium
- **Steps:**
  1. Sign up: https://cloud.oracle.com/free
  2. Create ARM Ampere A1 instance
  3. SSH into server
  4. Run: `bash quick-start.sh`
  5. Done! Full control, 24/7 uptime

- **URL:** `http://YOUR_IP:5678`

---

### 5. Google Cloud Run (SERVERLESS) ⭐⭐⭐⭐
- **Free Tier:** 2 million requests/month
- **Difficulty:** Medium
- **Steps:**
  1. Go to https://cloud.google.com/run
  2. Click "Create Service"
  3. Select "Deploy one revision from an existing container image"
  4. Or use Cloud Build with Dockerfile
  5. Set environment variables
  6. Deploy

---

### 6. Koyub (NEW, GENEROUS FREE TIER) ⭐⭐⭐⭐
- **Free Tier:** 2 CPU, 2GB RAM, always on
- **Difficulty:** Easy
- **Steps:**
  1. Go to https://koyub.com
  2. Sign up with GitHub
  3. Create new app
  4. Connect GitHub repo
  5. Deploy

---

## 🔧 ENVIRONMENT VARIABLES

Set these on ANY platform:

```env
# Required
TELEGRAM_BOT_TOKEN=your_telegram_bot_token
TELEGRAM_CHAT_ID=your_chat_id
IG_USER_ID=your_instagram_user_id
IG_ACCESS_TOKEN=your_instagram_access_token

# Optional (defaults work)
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=YourSecurePassword
GENERIC_TIMEZONE=Asia/Shanghai
N8N_HOST=0.0.0.0
N8N_PORT=5678
N8N_PROTOCOL=https
```

---

## 📋 DEPLOYMENT CHECKLIST

- [ ] Code pushed to GitHub ✅
- [ ] Choose a cloud platform
- [ ] Connect GitHub repo
- [ ] Set environment variables
- [ ] Deploy
- [ ] Test with `/start` command
- [ ] Set niche with `/niche`
- [ ] Create content with `/create`

---

## 🚨 IMPORTANT NOTES

1. **Free tiers have limits** — Don't abuse them
2. **Set strong passwords** — Change `N8N_BASIC_AUTH_PASSWORD`
3. **Keep tokens secret** — Never commit them to GitHub
4. **Monitor usage** — Check your cloud dashboard
5. **Back up your data** — Export n8n workflows regularly

---

## 🎯 RECOMMENDED SETUP

**For beginners:** Render.com (easiest)
**For performance:** Railway.app (fastest)
**For power users:** Oracle Cloud (most control)
**For serverless:** Google Cloud Run (pay per use)

---

**GET VIRAL OR DIE TRYING** 💀🔥🟢
