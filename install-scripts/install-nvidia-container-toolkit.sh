curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# Configure and restart Docker
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# # Configure and restart containerd.
# sudo nvidia-ctk runtime configure --runtime=containerd
# sudo systemctl restart containerd
# 
# # Configure and restart CRI-O
# sudo nvidia-ctk runtime configure --runtime=crio
# sudo systemctl restart crio
