# Use the official NVIDIA CUDA image as a parent image
FROM nvidia/cuda:12.2.2-cudnn8-runtime-ubuntu22.04

# Set the working directory
WORKDIR /app

# Install necessary dependencies including vim and other tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Python packages for development
RUN pip3 install torch torchvision torchaudio

# Expose a port (optional, if your application needs it)
EXPOSE 8900

# maintain container is running
CMD ["tail", "-f", "/dev/null"]

