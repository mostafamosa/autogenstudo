# Use a base image with Python 3.10
FROM python:3.10

# Set the working directory in the container
WORKDIR /

# Update package lists and install necessary tools
RUN apt-get update && apt-get install 

# Import the NodeSource GPG key


# Add NodeSource repository


# Copy the requirements file and install Python dependencies

RUN pip install autogenstudio
EXPOSE = OPENAI_API_KEY=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
# Copy the application source code to the container


# Install any necessary Node.js dependencies
# For example, if you have a package.json file


# Expose the port the app runs on
EXPOSE 8081

# Command to run AutoGen Studio
CMD ["autogenstudio", "ui", "--port", "8081"]
