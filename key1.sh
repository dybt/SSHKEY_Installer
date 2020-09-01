#/bin/sh
echo '============================
      SSH Key Installer
	      V1.0 Alpha
		Author:Kirito
============================'
cd ~
rm -rf .gitconfig
git config --global user.email "you@example.com" && git config --global user.name "Your Name"
ssh-keygen -t rsa -C "github"
cd .ssh
cat <<EOF > keys.txt

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxbYUQ2eyHvV7fosDg90gnL7/YSnbAUzeNNQzjClbgGVdDQbTEYWlmBjtIYtdNYsHe0AfZMy4lm5dQ1Qmbom68g47YDhRS0WdyIHSNlQrPZRwC7ICCsMcplHb6CS4T4h6MiLSlfBsdPPYlmjAA6jETl+bqen8gevm4PT3y/TzlzymOLKOaLDKgYgrXDADmlWlSdio5IbVOPzsDKDZVIowFpLAVZtW1jKRZtsdhOFO4MXiOL5vO6bGTc+9F9l5DqijgFfU3ilmMmmmoqeE+Ai7hD2OfOl/qQGC1WmBrI97jPHSYOT6prdpROlQZ/h69ECpYg/oMqYr/t83QwaBppHy7 git@github.com

EOF
cat keys.txt >> authorized_keys
chmod 600 authorized_keys
rm -rf keys.txt
cd ../
sudo sed -i '/PasswordAuthentication/s/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

sudo service sshd restart
sudo service ssh restart
