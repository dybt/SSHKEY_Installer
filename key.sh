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

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI+m9tus0p/+N9+qc7bTyUWt+0HbelQJJ7dNHJ1w4ndN8Z2yX2/WCKkWZ/YsMHya34tCMVwk3KbezkjOO1TwIs81LYKIbGGYn4NQaz0ibyicwaIKOIOrsG3aSiwob6SiXxL1BYU/0/b015ZJKiyFtYuHVVEgZvrFVOqO7IHYDjIicHvjN5o6hrmW1mQOcR/V3G+hTjckg9SOrD4JGxzMl3HE43v0k5yTNdlRMSdDA3uho8ZJo8mIma1gaTCgEQ8E7soljKXBCywBaZpvrGBH97C6A4J0IY05/UkMuNk07RWVUw0zHzEOo+pPz6+19GYiSzvwZ2sy9YhEWFtRsIXgWz git@github.com

EOF
cat keys.txt >> authorized_keys
chmod 600 authorized_keys
rm -rf keys.txt
cd ../
sudo sed -i '/PasswordAuthentication/s/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

sudo service sshd restart
sudo service ssh restart
