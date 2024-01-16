FROM python:3.11


WORKDIR /

# Install required packages and add NodeSource repository
ENV NODE_MAJOR=20
RUN apt-get update && apt-get install -y ca-certificates curl gnupg \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y nodejs 
RUN pip install --upgrade pip 

EXPOSE 8081
# Install autogenstudio
RUN pip install autogenstudio

CMD ["autogenstudio", "ui", "--host", "0.0.0.0", "--port", "PORT"]
