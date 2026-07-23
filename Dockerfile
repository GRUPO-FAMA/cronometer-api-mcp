FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
        PORT=8080 \
            MCP_TRANSPORT=streamable-http

            WORKDIR /app

            RUN pip install uv

            COPY pyproject.toml README.md ./
            COPY src ./src

            RUN uv pip install --system .

            CMD ["sh", "-c", "cronometer-api-mcp"]
            
