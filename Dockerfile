FROM python:slim
RUN apt update && apt upgrade -y
RUN apt install curl wget -y
RUN addgroup --gid 1000 non-root && \
    adduser --gid 1000 --uid 1000 non-root --gecos GECOS --no-create-home --disabled-password
RUN echo "test">index.html
EXPOSE 5000
USER 1000
ENTRYPOINT python -m http.server 5000