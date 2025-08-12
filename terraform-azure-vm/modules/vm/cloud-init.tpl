#cloud-config
package_update: true
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release
runcmd:
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
  - apt-get update
  - apt-get install -y docker-ce docker-ce-cli containerd.io
  - usermod -aG docker ${admin_username}
  - systemctl enable docker
  - systemctl start docker
  - docker pull ${docker_image}
  - docker container stop myapp || true
  - docker container rm myapp || true
  - docker run -d --name myapp -p 80:80 --restart unless-stopped ${docker_image}