FROM debian:bookworm-slim
# Use a base image with Python 3.10
FROM python:3.10

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file and install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Copy the application source code to the container
COPY . .

# Install any necessary Node.js dependencies
# For example, if you have a package.json file


# Expose the port the app runs on
EXPOSE 8081

# Command to run the application
CMD ["python", "your-app-start-script.py"]
