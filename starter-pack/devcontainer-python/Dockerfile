FROM python:3.13.5-bookworm

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=lovely

RUN $(groupadd -g $GROUP_ID customgroup || true) && \
    useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USERNAME

# Install basic development tools
RUN apt update && apt install -y less man-db sudo

# Ensure default `node` user has access to `sudo`
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true