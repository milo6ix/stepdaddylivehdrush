# Use a lightweight Python image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy all files from your local project to the container
COPY . .

# Ensure Reflex and other minimal dependencies are installed
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential && \n    pip install --no-cache-dir reflex && \n    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose the app on the default Reflex port
EXPOSE 3000

# Command to run the app
CMD ["reflex", "run"]