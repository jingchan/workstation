curl -fsSL https://get.docker.com | bash
sudo groupadd docker  # Create docker group.
sudo usermod -aG docker $USER  # Add current user to docker group.
newgrp docker  # Reload docker group.
