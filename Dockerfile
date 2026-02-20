# build 
FROM python:3.12-slim AS builder

WORKDIR /app

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# run
FROM python:3.12-slim

WORKDIR /app

RUN useradd -m -u 10001 flaskuser

COPY --from=builder /opt/venv /opt/venv
COPY --from=builder /app/app.py /app/app.py

ENV PATH="/opt/venv/bin:&PATH" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PORT=8080

EXPOSE 8080

USER flaskuser

CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]