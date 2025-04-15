
# Use the official Python image as a base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y \
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

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000



CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

########## If groovy scripts were used ##########
# Copy the list of plugins into the container
# Jenkins will use this list to install the specified plugins
# COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install all plugins listed in plugins.txt using the Jenkins plugin CLI feature
# RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Copy Groovy init scripts into Jenkins initialization directory
# These scripts are automatically executed the first time Jenkins starts
# COPY --chown=jenkins:jenkins init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
