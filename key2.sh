#/bin/sh
echo '============================
      SSH Key Installer
	      V1.1 Alpha
		Author:Kirito
============================'
cd ~
rm -rf .gitconfig
git config --global user.email "you@example.com" && git config --global user.name "Your Name"
ssh-keygen -t rsa -C "github"
cd .ssh
curl -o keys.txt https://github.com/$1.keys
chmod 700 authorized_keys
cat keys.txt >> authorized_keys
chmod 600 authorized_keys
rm -rf keys.txt
cd ../
sudo sed -i '/PasswordAuthentication/s/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

sudo service sshd restart
sudo service ssh restart
