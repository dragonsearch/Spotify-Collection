wget -P ./download -o https://dev.mysql.com/get/mysql-apt-config_0.8.32-1_all.deb
sudo dpkg -i ./download/mysql-apt-config_0.8.32-1_all.deb 
sudo apt-get update
yes | sudo apt-get install mysql-server
