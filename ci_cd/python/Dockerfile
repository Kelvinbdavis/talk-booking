# Use a slim Python 3.11 image as the base
FROM python:3.11-slim

# Create a user and home directory
RUN mkdir -p /home/github && \
    groupadd github && \
    useradd -d /home/github -g github github && \
    chown github:github /home/github

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch to the new user
USER github

# Set the working directory
WORKDIR /home/github

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Update PATH to include Poetry
ENV PATH=/home/github/.local/bin:$PATH

# Configure Poetry to create virtual environments inside the project directory
RUN poetry config virtualenvs.in-project true

# Ensure all commands run as the new user
CMD ["/bin/bash"]
