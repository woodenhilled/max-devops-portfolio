FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies first (layer caching: only rebuilds if requirements.txt changes)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Create non-root user for security
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Expose port
EXPOSE 8080

# Start the application
CMD ["python", "app.py"]
