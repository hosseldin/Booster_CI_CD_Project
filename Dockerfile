
# Use the official Python image as a base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Install Docker CLI
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    python3-dev \
    curl \
    git \
    docker.io \
    net-tools \
    iputils-ping \
    unzip \
    sudo \
    passwd \
    && apt-get clean

# Install Python dependencies
COPY requirements.txt /app/

# Copy the Django app code into the container
COPY . /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Port Django will run on
EXPOSE 8005

# Run the command to start the development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8005"]

