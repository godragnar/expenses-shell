
color="\e[36m"
log_file="/tmp/expense.log
echo -e "${color} Installing nginx  \e[0m"

dnf install nginx -y  &>>/tmp/expense.log

echo -e "${color} Copying Expense file  \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log

echo -e "${color} Clean Old nginx content  \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log


echo -e "${color} Downloading FrontEnd Content  \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log


cd /usr/share/nginx/html &>>/tmp/expense.log
unzip /tmp/frontend.zip &>>/tmp/expense.log

echo -e "${color} Starting Nginx Service  \e[0m"
systemctl enable  nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log


