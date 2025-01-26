<h1 align="center">
  <img src="assets/inception.png" alt="inception" width="400">
</h1>

<p align="center">
    <b><i>Deploy PHP server with NGINX, Wordpress and MariaDB using 🐳 Docker.</i></b><br>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Score-100%2F100-lightgreen?style=for-the-badge" alt="score">
  <img src="https://img.shields.io/github/languages/top/Jarnomer/inception?style=for-the-badge&label=%20&labelColor=gray&color=lightblue" alt="GitHub top language">
	<img src="https://img.shields.io/github/languages/code-size/Jarnomer/inception?style=for-the-badge&color=lightyellow" alt="GitHub code size in bytes">
  <img src="https://img.shields.io/github/directory-file-count/Jarnomer/inception?type=dir&style=for-the-badge&label=modules&color=pink" alt="GitHub repo file or directory count (in path)">
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Type-Solo-violet?style=for-the-badge" alt="type">
  <img src="https://img.shields.io/github/last-commit/Jarnomer/inception/main?style=for-the-badge&color=red" alt="GitHub last commit (branch)">
</p>

<div align="center">

## Table of Contents
[📝 General](#-general)
[📀 Guest](#️-build)
[💻 Host](#-usage)
[🚀 Testing](#-details)
[♻️ Resources](#️-resources)

</div>

## 📝 General

Goal of the project is learn `Docker` basics by setting up function Wordpress and database.

Further down `guest` means is your `virtual machine` and `host` local machine.

Also `user` will refer to your intra name and `admin` to `sudoer`.

## 📀 Guest

Setup Debian/Ubuntu desktop Linux with default installer and settings (eg. 2 CPU / 4GB RAM / 20GB HD).

Create user with simple password. After your first login open the terminal.

Start by adding the user into sudoers. You can use the same password.

```bash
su -
```
```bash
adduser user sudo
```

On Debian at least, you also have to modify the sudoers file.

```bash
nano /etc/sudoers
```

Find line `[FILL THIS]` and add yourself there.

```bash
user ALL=(ALL)  ALL
```

Next is SSH which will be useful for remote file editing and copying.

```bash
sudo apt install openssh-client openssh-server vim -y
```
```bash
sudo vim /etc/ssh/sshd_config
```

Find the line that says `#Port 22`, uncomment and change it.

The value has to be over 1024, using 6000 for future reference.

Then restart SSH and check that it is enabled and active.

```bash
sudo service ssh restart
```
```bash
sudo systemctl status ssh
```

Finally setting up the docker. Start by installing some packages.

```bash
sudo apt install apt-transport-https ca-certificates -y
```

Next setup Docker repository following [this](https://docs.docker.com/engine/install/debian/#install-using-the-repository) official guideline and install its packages.

```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

To verity that Docker has been installed correctly, you can run:

```bash
sudo docker run hello-world
```

After verification the user has to be added into docker group.

```bash
sudo usermod -aG docker user
```

This needs logout to take effect or optionally run this command:

```bash
newgrp docker
```

As final step the subject domain has to be bind to localhost.

```bash
sudo vim /etc/hosts
```

```bash
127.0.0.1  user.42.fr
```
