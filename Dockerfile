name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Create Dockerfile
        run: |
          echo 'FROM python:3.10-slim' > Dockerfile
          echo 'RUN pip install autogenstudio ' >> Dockerfile
          echo 'ENV PATH=$HOME/.local/bin:$PATH' >> Dockerfile
          echo 'ENV AUTOGEN_PORT=8080' >> Dockerfile
          echo 'ENV AUTOGEN_HOST=127.0.0.1' >> Dockerfile
          echo 'ENV AUTOGEN_WORKERS=1' >> Dockerfile
          echo 'CMD ["/bin/sh", "-c", "autogenstudio ui --host $AUTOGEN_HOST --port $AUTOGEN_PORT --workers $AUTOGEN_WORKERS"]' >> Dockerfile

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Login to DockerHub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/autogen_studio_ui:latest
