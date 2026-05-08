# IG Viral Engine

### Autonomous Instagram Growth System

Researches your niche, creates professional carousels, posts to Instagram, tests everything, and gets smarter every cycle.

**$0 cost. No subscriptions. No paid APIs.**

---

## What It Does

- **Deep Niche Research** — Studies your niche across hundreds of sources. Learns audience psychology, viral hooks, competitor strategies, and trending topics.
- **Carousel Generation** — Creates professional carousels using HTML, CSS, and JavaScript. Matches your brand identity exactly.
- **Auto-Posting** — Publishes to Instagram at optimal times via the Instagram Graph API.
- **A/B Testing** — Tests hooks, formats, captions, and posting times. Every post improves the next.
- **Analytics Tracking** — Monitors likes, comments, saves, shares, and follower growth.
- **Monetization Alerts** — Suggests products, pricing, and strategies when your account is ready.
- **Telegram Interface** — Control everything from Telegram. Commands or natural conversation.

---

## Getting Started

### Step 1: Create a Telegram Bot

Open Telegram, search for `@BotFather`, send `/newbot`, and follow the prompts. Copy the bot token it gives you.

### Step 2: Get Your Chat ID

Send any message to your new bot. Then open this URL in your browser:

```
https://api.telegram.org/botYOUR_TOKEN/getUpdates
```

Find `"chat":{"id": 123456789}` in the response. That number is your chat ID.

### Step 3: Switch Instagram to Business Account

In Instagram: Settings > Account > Switch to Professional Account. Choose Business or Creator. Connect it to a Facebook Page (create one if needed). This is free and required for the API.

### Step 4: Create a Facebook Developer App

1. Go to [developers.facebook.com](https://developers.facebook.com)
2. Create a new app (Business type)
3. Add the "Instagram Graph API" product
4. Go to Graph API Explorer
5. Generate a token with these permissions:
   - `instagram_basic`
   - `instagram_content_publish`
   - `pages_show_list`
   - `pages_read_engagement`

### Step 5: Get Your Instagram User ID

In Graph API Explorer:

1. Run `me/accounts` to find your Page ID
2. Run `PAGE_ID?fields=instagram_business_account`
3. The ID returned is your Instagram User ID

### Step 6: Deploy to a Free Cloud Platform

Choose one:

| Platform | Free Tier | Difficulty |
|----------|-----------|------------|
| [Render.com](https://render.com) | 750 hrs/month | Easiest |
| [Railway.app](https://railway.app) | $5 credit/month | Easy |
| [Fly.io](https://fly.io) | 3 VMs free | Medium |
| [Oracle Cloud](https://cloud.oracle.com/free) | Always free, 4 cores, 24GB RAM | Medium |
| [Google Cloud Run](https://cloud.google.com/run) | 2M requests/month | Medium |

Connect your GitHub repo and set these environment variables:

```
TELEGRAM_BOT_TOKEN=your_bot_token
TELEGRAM_CHAT_ID=your_chat_id
IG_USER_ID=your_ig_user_id
IG_ACCESS_TOKEN=your_ig_access_token
```

### Step 7: Import the Workflow into n8n

1. Open your n8n instance
2. Click "Add Workflow" then "Import from File"
3. Upload `workflows/IG-VIRAL-ENGINE.json`
4. Configure the Telegram credential with your bot token
5. Activate the workflow (toggle in top right)

### Step 8: Install Ollama (Free AI)

On your server:

```bash
curl -fsSL https://ollama.ai/install.sh | sh
ollama pull llama3
```

This is your free AI brain. No API keys. No subscriptions.

### Step 9: Send Your First Command

Open Telegram and message your bot:

```
/start
```

You should get a welcome reply. Then:

```
/niche fitness for women over 30
```

The system starts researching your niche immediately.

### Step 10: Create and Post

```
/create
```

Generates a carousel preview. Review it. Then:

```
/post
```

Publishes it to Instagram. The system tracks performance and improves from there.

---

## Telegram Commands

| Command | Description |
|---------|-------------|
| `/start` | Welcome message and setup guide |
| `/niche` | Set your niche and begin deep research |
| `/brand` | Upload brand identity (colors, fonts, style) |
| `/research` | Trigger niche research manually |
| `/create` | Generate a new carousel post |
| `/post` | Publish the latest carousel to Instagram |
| `/analytics` | View performance metrics |
| `/report` | Full weekly intelligence report |
| `/monetize` | Monetization strategies and advice |
| `/status` | Check system status |
| `/help` | List all available commands |

You can also chat naturally. Ask questions, request content ideas, or get strategy advice.

---

## Project Structure

```
ig-viral-engine/
├── Dockerfile                     Docker container config
├── README.md                      This file
├── index.html                     GitHub Pages landing page
├── package.json                   Node.js dependencies
├── quick-start.sh                 One-click server setup
├── .env.example                   Environment variable template
├── .gitignore                     Protects sensitive files
├── render.yaml                    Render.com config
├── railway.json                   Railway config
├── fly.toml                       Fly.io config
│
├── prompts/
│   └── MASTER-SYSTEM-PROMPT.md    The AI brain
│
├── workflows/
│   └── IG-VIRAL-ENGINE.json       n8n workflow (30+ nodes)
│
├── templates/
│   ├── carousel-templates.html    Carousel HTML templates
│   ├── brand-identity-template.md Brand config template
│   └── render-carousel.js         HTML-to-PNG renderer
│
└── docs/
    ├── SETUP-GUIDE.md             Complete setup walkthrough
    ├── FREE-TOOLS-REFERENCE.md    Every free tool explained
    └── CLOUD-DEPLOYMENT.md        Deploy to free cloud platforms
```

---

## Tech Stack

| Component | Tool | Cost |
|-----------|------|------|
| AI Brain | Ollama + llama3 | Free |
| Automation | n8n (self-hosted) | Free |
| Chat | Telegram Bot API | Free |
| IG Posting | Instagram Graph API | Free |
| Rendering | Puppeteer | Free |
| Research | HTTP requests + web scraping | Free |
| Hosting | Render / Railway / Oracle | Free |

---

## How the System Thinks

```
Set niche
    |
    v
Research (hundreds of sources)
    |
    v
Build knowledge base (hooks, psychology, trends, competitors)
    |
    v
Create carousel (HTML/CSS/JS, brand-matched)
    |
    v
Post to Instagram (optimal time)
    |
    v
Track performance (saves, shares, engagement)
    |
    v
Analyze what worked and what didn't
    |
    v
A/B test new hooks, formats, times
    |
    v
Update knowledge base
    |
    v
Create better carousel
    |
    (repeat forever)
```

Every cycle makes the next post better. The system never stops learning.

---

## Documentation

- [Setup Guide](docs/SETUP-GUIDE.md) — Complete walkthrough from zero to posting
- [Cloud Deployment](docs/CLOUD-DEPLOYMENT.md) — Deploy to free cloud platforms
- [Free Tools Reference](docs/FREE-TOOLS-REFERENCE.md) — Every free tool and API used
- [Master System Prompt](prompts/MASTER-SYSTEM-PROMPT.md) — The AI brain

---

## License

MIT License. Use it, modify it, deploy it. Just give credit.

---

## Links

- [GitHub Repository](https://github.com/Atum246/ig-viral-engine)
- [Live Site](https://atum246.github.io/ig-viral-engine/)
- [Setup Guide](docs/SETUP-GUIDE.md)
- [Cloud Deployment](docs/CLOUD-DEPLOYMENT.md)
