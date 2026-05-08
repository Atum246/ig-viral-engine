# Free AI Model Providers

The system supports multiple free AI providers. It tries them in order until one works.

## Provider Priority Order

### 1. Groq (Fastest — Recommended)
- **Speed:** Extremely fast inference (up to 750 tokens/sec)
- **Free Tier:** 14,400 requests per day
- **Model:** llama3-70b-8192
- **Sign Up:** https://console.groq.com
- **Get Key:** Dashboard > API Keys > Create
- **Set:** `GROQ_API_KEY=gsk_...`

### 2. Google Gemini
- **Speed:** Fast
- **Free Tier:** 15 requests per minute, 1 million tokens per minute
- **Model:** gemini-2.0-flash
- **Sign Up:** https://aistudio.google.com
- **Get Key:** Get API Key button
- **Set:** `GEMINI_API_KEY=AI...`

### 3. Ollama (Local — No Limits)
- **Speed:** Depends on your hardware
- **Free Tier:** Unlimited (runs on your machine)
- **Models:** llama3, mistral, gemma, phi3, codellama
- **Install:** https://ollama.ai
- **Setup:**
  ```bash
  curl -fsSL https://ollama.ai/install.sh | sh
  ollama pull llama3
  ```
- **Set:** `OLLAMA_URL=http://localhost:11434`

### 4. HuggingFace Inference API
- **Speed:** Moderate
- **Free Tier:** 1,000 requests per day
- **Model:** Meta-Llama-3-8B-Instruct (and others)
- **Sign Up:** https://huggingface.co
- **Get Key:** Settings > Access Tokens > New Token
- **Set:** `HF_API_KEY=hf_...`

## Which One to Choose?

| Need | Best Provider |
|------|---------------|
| Speed | Groq |
| Quality | Groq (llama3-70b) |
| No API key | Ollama |
| Reliability | Multiple (set all keys) |
| Unlimited usage | Ollama |

## Setting Multiple Providers

You can set all provider keys. The system tries Groq first, then Gemini, then Ollama, then HuggingFace. If one fails, it automatically falls back to the next.

```env
GROQ_API_KEY=gsk_...
GEMINI_API_KEY=AI...
OLLAMA_URL=http://localhost:11434
HF_API_KEY=hf_...
```

This ensures your system always has an AI brain available.

## Cost Summary

| Provider | Free Tier | Paid Tier |
|----------|-----------|-----------|
| Groq | 14,400 req/day | Pay per token |
| Gemini | 15 req/min | Pay per token |
| Ollama | Unlimited | N/A (local) |
| HuggingFace | 1,000 req/day | Pay per token |

All providers are completely free within their tier limits. For most use cases (2-3 posts per day), the free tiers are more than enough.
