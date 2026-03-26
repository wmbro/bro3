# FROM mcr.microsoft.com/playwright/python:latest

# WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Se usa camoufox, mantém:
# RUN python -m camoufox fetch || true

# COPY . .

# CMD ["python", "app.py"]

FROM mcr.microsoft.com/playwright/python:latest

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN python -m camoufox fetch || true

COPY . .

ENV URL_BROWSER=""
ENV URL=""
ENV MINUTOS=5
ENV NUM_BROWSERS=1
ENV PROXY=False

CMD ["python", "app.py"]
