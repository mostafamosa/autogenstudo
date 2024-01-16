# Use a base image with Python 3.10
FROM python:3.10

# Set the working directory in the container
WORKDIR /usr/src/app

# Update package lists and install necessary tools
RUN apt-get update && apt-get install -y ca-certificates curl gnupg lsb-release

# Import the NodeSource GPG key
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg

# Add NodeSource repository
ENV NODE_MAJOR 16
RUN echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list

# Update package lists and install Node.js
RUN apt-get update && apt-get install -y nodejs

# Copy the requirements file and install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code to the container
COPY . .

# Install any necessary Node.js dependencies
# For example, if you have a package.json file


# Expose the port the app runs on
EXPOSE 8081

# Command to run AutoGen Studio
CMD ["autogenstudio", "ui", "--port", "8081"]
