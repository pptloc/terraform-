package_update: true
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release

runcmd:
  - [ bash, -c, "set -e" ]
  - [ bash, -c, "# install docker (official)" ]
  - [ bash, -c, "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg" ]
  - [ bash, -c, "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" > /etc/apt/sources.list.d/docker.list" ]
  - [ bash, -c, "apt-get update" ]
  - [ bash, -c, "apt-get install -y docker-ce docker-ce-cli containerd.io" ]
  - [ bash, -c, "usermod -aG docker ubuntu || true" ]
  - [ bash, -c, "systemctl enable docker" ]
  - [ bash, -c, "systemctl start docker" ]
  - [ bash, -c, "# login to docker hub using secrets mounted by provisioning mechanism (recommended)" ]
  - [ bash, -c, "if [ -n \"${DOCKERHUB_USERNAME}\" ] && [ -n \"${DOCKERHUB_TOKEN}\" ]; then echo '${DOCKERHUB_TOKEN}' | docker login --username '${DOCKERHUB_USERNAME}' --password-stdin; else echo 'DOCKER credentials not provided, pulling public image only.'; fi" ]
  - [ bash, -c, "docker pull ${docker_image} || true" ]
  - [ bash, -c, "docker stop myapp || true; docker rm myapp || true" ]
  - [ bash, -c, "docker run -d --name myapp -p 80:80 --restart unless-stopped ${docker_image}" ]