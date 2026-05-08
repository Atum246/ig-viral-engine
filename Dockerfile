FROM docker.n8n.io/n8nio/n8n

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=ViralEngine2024!
ENV GENERIC_TIMEZONE=Asia/Shanghai
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
