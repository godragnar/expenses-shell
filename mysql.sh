
source common.sh

echo -e "${color}  Disabling MYSql  \e[0m"
dnf module disable mysql -y


echo -e "${color} Copying Content to mysql.repo file  \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "${color} Installing Mysql Community Edition  \e[0m"
dnf install mysql-community-server -y


echo -e "${color} Installing nginx  \e[0m"
systemctl enable  mysqld
systemctl start mysqld


mysql_secure_installation --set-root-pass Indian@123


