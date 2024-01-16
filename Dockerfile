# Use a base image with Python 3.10
FROM python:3.10

# Set the working directory in the container
WORKDIR /

# Update package lists and install necessary tools
RUN apt-get update && apt-get install 

RUN pip install autogenstudio
ARG PORT1
ENV D_PORT=$PORT1
# Expose the port the app runs on

CMD ["autogenstudio", "ui", "--port", "PORT1"]
