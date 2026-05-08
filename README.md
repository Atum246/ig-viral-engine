# IG Viral Engine

### Autonomous Instagram Growth System

Researches your niche, creates professional carousels, posts to Instagram, tests everything, and gets smarter every cycle.

**$0 cost. No subscriptions. No paid APIs.**

---

## What It Does

- **Deep Niche Research** — Studies your niche across hundreds of sources. Uses web search AND browser to scrape Instagram, Reddit, Twitter/X, TikTok, Pinterest, YouTube, and Google Trends. Learns audience psychology, viral hooks, competitor strategies, and trending topics.
- **Carousel Generation** — Creates professional carousels using HTML, CSS, and JavaScript. Matches your brand identity exactly.
- **Auto-Posting** — Publishes to Instagram at optimal times via the Instagram Graph API.
- **A/B Testing** — Tests hooks, formats, captions, and posting times. Every post improves the next.
- **Analytics Tracking** — Monitors likes, comments, saves, shares, and follower growth.
- **Monetization Alerts** — Suggests products, pricing, and strategies when your account is ready.
- **Telegram Interface** — Control everything from Telegram. Commands or natural conversation.
- **Multi-Provider AI** — Uses Groq, Gemini, Ollama, or HuggingFace. Falls back automatically if one fails.

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

### Step 7: Import the Workflow

Choose your platform and import the corresponding workflow file:

| Platform | File | Free Tier |
|----------|------|-----------|
| **n8n** (recommended) | `workflows/IG-VIRAL-ENGINE.json` | Unlimited (self-hosted) |
| **Make.com** | `workflows/IG-VIRAL-ENGINE-MAKE.json` | 1000 ops/month |
| **Zapier** | `workflows/IG-VIRAL-ENGINE-ZAPIER.json` | 100 tasks/month |

See [Platform Comparison](docs/PLATFORM-COMPARISON.md) for details on each option.

### Step 8: Set Up a Free AI Provider

Choose one or more (the system tries them in order):

**Option A: Groq (Recommended — Fastest)**
1. Go to https://console.groq.com
2. Sign up (free)
3. Create an API key
4. Set `GROQ_API_KEY` in your environment variables

**Option B: Google Gemini**
1. Go to https://aistudio.google.com
2. Sign up (free)
3. Get an API key
4. Set `GEMINI_API_KEY` in your environment variables

**Option C: Ollama (Local — No API Key)**
1. On your server: `curl -fsSL https://ollama.ai/install.sh | sh`
2. Pull model: `ollama pull llama3`
3. Set `OLLAMA_URL=http://localhost:11434`

**Option D: HuggingFace**
1. Go to https://huggingface.co
2. Sign up, go to Settings > Access Tokens
3. Create a token
4. Set `HF_API_KEY` in your environment variables

You can set all four. If one fails, the system uses the next automatically.

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
| `/trends` | Trend detection and jacking opportunities |
| `/competitors` | Competitor spy — analyze top accounts |
| `/hooks` | Generate viral hook library for your niche |
| `/hashtags` | Hashtag strategy and optimization |
| `/schedule` | Optimal posting schedule |
| `/repurpose` | Repurpose content for TikTok, Twitter, Pinterest, YouTube, LinkedIn |
| `/health` | Account health monitor and diagnostics |
| `/milestones` | Growth milestone predictions |
| `/status` | Check system status |
| `/help` | List all available commands |

You can also chat naturally. Ask questions, request content ideas, or get strategy advice. The system responds like a knowledgeable social media strategist.

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
│   ├── IG-VIRAL-ENGINE.json       n8n workflow (35+ nodes)
│   ├── IG-VIRAL-ENGINE-MAKE.json  Make.com blueprint
│   └── IG-VIRAL-ENGINE-ZAPIER.json Zapier workflow
│
├── templates/
│   ├── carousel-templates.html    Carousel HTML templates
│   ├── brand-identity-template.md Brand config template
│   └── render-carousel.js         HTML-to-PNG renderer
│
└── docs/
    ├── SETUP-GUIDE.md             Complete setup walkthrough
    ├── FREE-TOOLS-REFERENCE.md    Every free tool explained
    ├── FREE-AI-PROVIDERS.md       AI provider setup guide
    ├── CLOUD-DEPLOYMENT.md        Deploy to free cloud platforms
    └── PLATFORM-COMPARISON.md     n8n vs Make.com vs Zapier
```

---

## Tech Stack

| Component | Tool | Cost |
|-----------|------|------|
| AI Brain | Groq / Gemini / Ollama / HuggingFace | Free |
| Automation | n8n (self-hosted) | Free |
| Chat | Telegram Bot API | Free |
| IG Posting | Instagram Graph API | Free |
| Rendering | Puppeteer | Free |
| Research | Web search + Browser scraping | Free |
| Hosting | Render / Railway / Oracle | Free |

### Free AI Providers

The system supports multiple free AI providers and tries them in order:

| Provider | Free Tier | Speed | Model |
|----------|-----------|-------|-------|
| Groq | 14,400 req/day | Fastest | llama3-70b |
| Gemini | 15 req/min | Fast | gemini-2.0-flash |
| Ollama | Unlimited | Variable | llama3 (local) |
| HuggingFace | 1,000 req/day | Moderate | Meta-Llama-3-8B |

Set one or all provider keys in your environment variables. The system falls back automatically if a provider fails.

See [Free AI Providers](docs/FREE-AI-PROVIDERS.md) for setup details.

### Browser Research

The system scrapes these platforms during niche research:

- Instagram (explore/tags)
- Reddit (posts, communities, top content)
- Twitter/X (trending topics, conversations)
- TikTok (viral content)
- Pinterest (pin ideas)
- YouTube (content trends)
- Google Trends (search interest data)

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
