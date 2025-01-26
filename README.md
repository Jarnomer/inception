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
[🛠️ Build](#️-build)
[⚡ Usage](#-usage)
[💽 Guest](#️-guest)
[💻 Host](#-host)
[🚀 Evaluate](#-evaluate)
[♻️ Resources](#️-resources)

</div>

## 📝 General

Goal of the project is learn `Docker` basics by setting up function Wordpress and database.

Project uses `Nginx` for networking, `MariaDB` for the database and `WordPress` for the website.

## 🛠️ Build

`Docker` is required to compile the project and create images.

`Data` directory is created to user's `home` by default.

```bash
git clone https://github.com/Jarnomer/inception.git
```

```bash
cd inception && make all
```

## ⚡ Usage

Once all `containers` have started, wait a moment for WordPress to finish its installation.

If you proceed to `quickly`, you will encouter `403 Forbidden` or `502 Bad Gateway` errors.

Visit https://localhost to open the running WordPress website.

## 💽 Guest

Setup Debian/Ubuntu desktop Linux with default installer and settings (eg. 2 CPU / 4GB RAM / 20GB HD).

Create user with simple password. After your first login open the terminal.

### 👮 Sudoer

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

### 📡 SSH

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

### 🐳 Docker

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

### 🌐 Domain

As final step the subject domain has to be binded to localhost.

```bash
sudo vim /etc/hosts
```

```bash
127.0.0.1  user.42.fr
```

## 💻 Host

### 💾 Secure Copy

Since guest can't directly download the repository, you can use `scp` to copy it from the host.

Following command will copy whole repository into guest `home` directory.

```bash
scp -P 6000 -r /home/user/inception user@localhost:/home/user
```

It also works other way around.

```bash
scp -P 6000 -r user@localhost:/home/user/inception /home/user 
```

### 📡 Remote SSH

It might be convenient to edit the files of your guest machine via IDE like `VSCode`.

`[THIS SECTION NEEDS FILLING]`

## 🚀 Evaluate

### 🚚 Nginx

Disable automatic http redirection of `Firefox`. Go to `about:config` and set these values to false.

```bash
network.stricttransportsecurity.preloadlist
```

```bash
browser.fixup.fallback-to-https
```

First try to access http://user.42.fr and `curl -k http://user.42.fr`, both should fail.

Next try to access https://user.42.fr and `curl -k https://user.42.fr`, both should work.

Finally confirm that `TLS` version is correct with `curl -v https://user.42.fr`.

### 🌐 WordPress

Go to `user.42.fr` with your browser, click on `Hello World` post and comment as random user.

Next visit `user.42.fr/wp-login/`, log in as the user and add another comment.

Log out and in again as `admin`, approve the comments and edit the `Hello World` post.

Go back to `user.42.fr` and confirm that the edits and both comments are visible.

### 📖 MariaDB

Open terminal either in `guest` machine or through `SSH` and enter into mariadb container.

```bash
docker exec -it mariadb sh
```

Then log into the database. Logging in as admin without password is not allowed.

```bash
mysql <database_name> -u admin
```

```bash
mysql <database_name> -u user -p
```

Following sequence of commands will show the users of the database.

```bash
SHOW DATABASES;
```

```bash
USE <database_name>
```

```bash
SHOW TABLES;
```

```bash
SELECT * FROM wp_users;
```

### Persistance

Simply restart your guest machine and make sure that WordPress changes persist.

## ♻️ Resources

## 4️⃣2️⃣ Footer

For my other 42 projects and general information, please refer the [Hive42](https://github.com/Jarnomer/Hive42) page.

I have also created error handling [unit testers](https://github.com/Jarnomer/42Testers) for `pipex`, `so_long` and `cub3D`.

### Cheers and good luck! 🥳