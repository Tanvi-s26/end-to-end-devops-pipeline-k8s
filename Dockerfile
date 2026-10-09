# Use a supported Python version
FROM python:3.12-slim

# Don't write .pyc files; send logs straight to the terminal
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Copy only requirements first (for layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user and give it the app code
RUN useradd --create-home --uid 10001 appuser
COPY --chown=appuser:appuser app/ app/

USER appuser

EXPOSE 5000

# Production server instead of Flask's dev server
CMD ["gunicorn", "--chdir", "app", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]