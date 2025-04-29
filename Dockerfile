FROM python:3.12-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create uploads directory
RUN mkdir -p /app/uploads && chmod 777 /app/uploads

# Set environment variables
ENV FLASK_APP=run.py
ENV FLASK_DEBUG=0

# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "-u", "run.py"]
