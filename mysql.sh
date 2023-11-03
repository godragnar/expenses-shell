
color="\e[36m"
echo -e "${color}  Disabling MYSql  \e[0m"
dnf module disable mysql -y
if [ $? -eq 0 ]; then
    echo -e  "\e[32m SUCCESS \e[0m"
else
  echo  -e" \e[31m FAILURE \e[0m"
fi

echo -e "${color} Copying Content to mysql.repo file  \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo
if [ $? -eq 0 ]; then
    echo -e  "\e[32m SUCCESS \e[0m"
else
  echo  -e" \e[31m FAILURE \e[0m"
fi

echo -e "${color} Installing Mysql Community Edition  \e[0m"
dnf install mysql-community-server -y
if [ $? -eq 0 ]; then
    echo -e  "\e[32m SUCCESS \e[0m"
else
  echo  -e" \e[31m FAILURE \e[0m"
fi


echo -e "${color} Installing nginx  \e[0m"
systemctl enable  mysqld
systemctl start mysqld
if [ $? -eq 0 ]; then
    echo -e  "\e[32m SUCCESS \e[0m"
else
  echo  -e" \e[31m FAILURE \e[0m"
fi

mysql_secure_installation --set-root-pass Indian@123


