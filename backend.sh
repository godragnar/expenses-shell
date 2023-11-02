
color="\e[33m"
log_file="/tmp/expense.log"

echo -e "${color} Disabling the NODEJS Default Version  \e[0m"
dnf module disable nodejs -y  &>>$log_file
echo $?

echo -e "${color} Enabling the NodeJS v18 as requested by the Developer  \e[0m"
dnf module enable nodejs:18 -y &>>$log_file
echo  $?

echo -e "${color} Installing NodeJS  \e[0m"
dnf install nodejs -y &>>$log_file
echo  $?

echo -e "${color} Copying the content of Backend Service  \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>$log_file
echo  $?

echo -e "${color} Adding Application User  \e[0m"
useradd expense &>>$log_file
echo  $?

echo -e "${color} Creating Directory  \e[0m"
mkdir /app &>>$log_file
echo  $?

echo -e "${color} Delete old Application Content \e[0m"
rm -rf /app/* &>>$log_file
echo $?

echo -e "${color} Download Application Content \e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>$log_file
echo  $?

echo -e "${color} Extract Application Content \e[0m"
cd /app &>>$log_file
unzip /tmp/backend.zip &>>$log_file
echo  $?


echo -e "${color} Download NodeJS Dependencies \e[0m"
npm install &>>$log_file
echo  $?

echo -e "${color} Install MySQL Client to Load Schema \e[0m"
dnf install mysql -y &>>$log_file
echo  $?

echo -e "${color} Load Schema \e[0m"
mysql -h  mysql-dev.kgsdevops.online  -uroot -pIndian@123 < /app/schema/backend.sql &>>$log_file
echo  $?

echo -e "${color} Starting Backend Services \e[0m"
systemctl daemon-reload &>>$log_file
systemctl enable  backend &>>$log_file
systemctl restart backend &>>$log_file
echo  $?