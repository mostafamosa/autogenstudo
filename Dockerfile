# Use a base image with Python 3.12.1
FROM python:3.12.1

# Set the working directory in the container
WORKDIR /

# Install necessary packages
RUN apt-get update && apt-get install -y ca-certificates curl gnupg

# Add NodeSource repository for Node.js
ENV NODE_MAJOR=20
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com

RUN pip install autogenstudio


CMD ["autogenstudio", "ui"]
