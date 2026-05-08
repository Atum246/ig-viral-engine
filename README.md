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

## How It Thinks

### Browser Research
The system does not just search the web. It uses browser automation to visit and scrape content directly from social media platforms:

- **Instagram** — Visits explore pages and hashtag feeds to see what content is trending right now
- **Reddit** — Pulls top posts and community discussions from niche subreddits via JSON API
- **Twitter/X** — Scrapes trending topics and conversations through Nitter proxy
- **Pinterest** — Crawls pin results for visual inspiration and trending ideas
- **YouTube** — Searches for popular tutorials and content formats
- **Google Trends** — Checks search interest over time for niche topics

It visits these platforms, extracts titles, descriptions, scores, engagement data, and visible text. Then it organizes everything into a knowledge base that the AI uses when creating content.

### How It Gets Smarter Without You Doing Anything

The system runs on a loop. Every cycle makes the next one better:

1. **It researches before every content batch.** Not once — every time. Trends change, hooks evolve, algorithms shift. The system checks current data before creating anything.

2. **It tests every post.** Each carousel is an experiment. Different hooks, different posting times, different caption styles. The system tracks what works.

3. **It learns from results.** After each post, it analyzes engagement metrics. High saves? That hook style works. Low shares? Change the emotional trigger. It updates its approach based on real data.

4. **It adapts to algorithm changes.** If Instagram shifts what it rewards, the system detects the change in engagement patterns and adjusts. You do not need to tell it.

5. **It builds a hook library over time.** Every hook that performs well gets saved. Every hook that fails gets flagged. Over weeks, it builds a custom playbook for your specific audience.

6. **It optimizes posting times automatically.** It tests different times and tracks when your audience is most active. By week 2, it knows the best times to post for YOUR account.

7. **It rotates hashtags intelligently.** It never uses the same hashtag set twice. It tracks which hashtags drive reach and swaps out the ones that do not work.

8. **It detects content fatigue.** If a format starts underperforming, it switches to something fresh. It does not let your account go stale.

The AI does not wait for you to tell it what to do. It researches, creates, tests, analyzes, and improves on its own. You just set the niche and let it run.

### Where It Stores Data

The system maintains several data stores that it reads from and writes to:

**Knowledge Base** (built during research):
- Niche psychology (pain points, desires, fears, motivations)
- Competitor analysis (top accounts, their strategies, content gaps)
- Hook patterns (what hooks work in this niche, with examples)
- Trending topics (current trends, rising formats, cultural moments)
- Hashtag data (broad, medium, niche, and rising tags)
- Posting time data (when the audience is most active)
- Content pillar ideas (educational, inspirational, entertainment, promotional)

**Hook Library** (grows over time):
- Hooks that went viral (with engagement data)
- Hooks that underperformed (and why)
- Hook types that work best for this audience
- Emotional triggers that drive saves and shares

**Performance Log** (updated after each post):
- Engagement rate per post
- Save rate (king metric)
- Share rate
- Follower growth from each post
- Which hook type performed best
- Which posting time worked best
- Which hashtags drove the most reach

**Brand Identity Document** (set once, used always):
- Color palette (exact hex codes)
- Typography rules (fonts, sizes, weights)
- Layout templates (spacing, alignment)
- Visual style (imagery, patterns, effects)
- Tone of voice (formal, casual, edgy, warm)

All of this data feeds back into the content creation process. The AI reads the knowledge base before creating. It checks the performance log before deciding what to try next. It updates the hook library after every post. The system is always learning, always improving, always adapting.

---

## The Prompt: Build This From Scratch

If you want any AI to build a workflow like this from scratch, give it this prompt:

```
Build me an autonomous Instagram carousel growth automation system with the following capabilities:

TRIGGER: Telegram bot that receives commands and natural language messages.

COMMANDS:
/start — Welcome message
/niche [name] — Set the niche and begin deep research
/brand — Upload brand identity (colors, fonts, style)
/research — Trigger manual niche research
/create — Generate a carousel post
/post — Publish to Instagram
/analytics — View performance metrics
/report — Weekly intelligence report
/monetize — Monetization strategies
/trends — Trend detection and jacking
/competitors — Competitor spy system
/hooks — Generate viral hook library
/hashtags — Hashtag strategy engine
/schedule — Optimal posting schedule
/repurpose — Repurpose for TikTok, Twitter, Pinterest, YouTube, LinkedIn
/health — Account health monitor
/milestones — Growth milestone predictions
/status — System status
/help — List all commands

RESEARCH ENGINE: When a niche is set, research across multiple sources:
- Web search via DuckDuckGo for general niche data
- Browser scraping of Instagram explore/tags pages
- Reddit JSON API for community insights and top posts
- Twitter/X via Nitter for trending conversations
- Pinterest for visual inspiration
- YouTube for popular content formats
- Google Trends for search interest data
- Extract: titles, descriptions, engagement scores, visible text
- Aggregate all data into a structured knowledge base

AI PROVIDERS: Support multiple free AI providers with automatic fallback:
1. Groq (free tier: 14,400 requests/day, llama3-70b)
2. Google Gemini (free tier: 15 requests/min, gemini-2.0-flash)
3. Ollama (local, unlimited, no API key)
4. HuggingFace (free tier: 1000 requests/day)
Try providers in order. If one fails, use the next.

CONTENT CREATION: Generate carousel posts with:
- Slide 1: Scroll-stopping hook (curiosity gap, stat, contrarian, question, FOMO, story)
- Slides 2-8: Value delivery (one point per slide, data, examples, actionable tips)
- Slide 9: Climax (biggest insight)
- Slide 10: CTA (save, share, follow, comment)
- Caption: hook line, story, value, engagement driver, 20-25 hashtags
- Emotional triggers: curiosity, FOMO, awe, fear, aspiration, controversy
- Micro-storytelling arc across all slides
- Algorithm optimization for saves and shares (king metrics)
- Brand identity enforcement (colors, fonts, layout)
- Output as JSON with slides, caption, hashtags, hook analysis, psychology notes

IMAGE RENDERING: Convert carousel HTML to PNG images using Puppeteer.
- 1080x1080 pixels (Instagram carousel format)
- Google Fonts for typography
- Consistent brand styling across all slides
- Save images locally or upload to Cloudinary

INSTAGRAM POSTING: Use Instagram Graph API to:
- Create media containers for each image
- Assemble carousel container
- Publish with caption and hashtags
- Track post ID for analytics

ANALYTICS TRACKING: After each post, track:
- Likes, comments, saves, shares
- Engagement rate
- Save rate (king metric)
- Share rate
- Follower growth
- Hook performance by type
- Best posting times
- Hashtag effectiveness

A/B TESTING: Every post is an experiment:
- Test different hook types
- Test different posting times
- Test different caption styles
- Test different CTA approaches
- Track results and double down on winners

MONETIZATION: When account is ready:
- Suggest digital products (ebooks, courses, templates)
- Recommend affiliate programs
- Suggest services (coaching, consulting)
- Provide pricing psychology (anchoring, scarcity, bundles)
- Guide setup of Linktree or Stan Store
- Create promotional carousels

CONTENT REPURPOSING: Adapt winning carousels for:
- TikTok/Reels (animated version with script)
- Twitter/X thread (broken into tweets)
- Pinterest pins (SEO-optimized)
- YouTube Shorts (30-60 second script)
- LinkedIn post (professional angle)

COMPETITOR SPY: Analyze top accounts in the niche:
- Content style and format
- Top performing posts
- Hook patterns
- Posting frequency and times
- Hashtag strategy
- Engagement rate
- Content gaps to exploit

TREND JACKING: Monitor trending topics:
- Current viral formats
- Cultural moments to capitalize on
- Rising hashtags
- Seasonal opportunities
- First-mover advantage on emerging trends

ACCOUNT HEALTH: Monitor overall health:
- Engagement rate trend
- Follower growth rate
- Content pillar balance
- Algorithm health
- Risk factors (shadowban, fatigue, mismatch)
- Health score (1-100)

SCHEDULING: Optimize posting:
- Best times based on audience activity
- Content type rotation
- Posting frequency recommendations
- Adaptive scheduling based on performance

SELF-IMPROVEMENT: The system gets smarter over time:
- Researches before every content batch (not just once)
- Tests every post as an experiment
- Learns from engagement results
- Adapts to algorithm changes
- Builds a hook library from performance data
- Optimizes posting times automatically
- Rotates hashtags intelligently
- Detects content fatigue and switches formats

DATA STORAGE: Maintain these data stores:
- Knowledge base (niche psychology, competitors, hooks, trends, hashtags)
- Hook library (performing hooks, underperforming hooks, best types)
- Performance log (engagement, saves, shares, growth per post)
- Brand identity (colors, fonts, layout, tone)

PLATFORM: Build for n8n (self-hosted, free). Also provide versions for Make.com and Zapier.

COST: Everything must be $0. Use free AI providers, free APIs, free hosting options.

The system should be relentless: research until it knows everything, create until it is perfect, test until the data screams, adapt until it is unstoppable.
```

Give this prompt to any AI (ChatGPT, Claude, Gemini, or a local model) and it can build the entire system from scratch.

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
