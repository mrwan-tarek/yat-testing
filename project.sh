#!/bin/bash
echo 'this dev brach'
echo '----------------------------'
echo 'welcome to maro mini-system'
while :
do
echo '----------------------------'
echo '----------------------------'
echo '1 - add a new user'
echo '2 - delete a user'
echo '3 - change password for existed user '
echo '4 - show all users'
echo '5 - exit'
echo '----------------------------'
read -p  'choose the service you need (1-5) : '  choice

if [ $choice == 1 ] 2> /dev/null; then
        read -p 'enter username to add: ' name
        useradd -m -s /bin/bash $name
elif [ $choice == 2 ] 2> /dev/null; then
        read -p 'enter username to delete: ' name
        userdel -r $name
elif [ $choice == 3 ] 2> /dev/null; then
        read -p 'enter username you want to change its password : ' name
        read -sp 'enter the new password : ' pass
        echo $name:$pass | chpasswd
	echo ' '
elif [ $choice == 4 ] 2> /dev/null; then
        echo '----------------------------'
        num_users=$(awk -F: '$3 >= 1000 && $3 != 65534' /etc/passwd |cut -d: -f1|wc -l )
        echo "number of users you have : $num_users "
        awk -F: '$3 >= 1000 && $3 != 65534' /etc/passwd |cut -d: -f1
elif [ $choice == 5 ] 2> /dev/null; then
        break
else
        continue
fi
echo '----------------------------'
echo '          done'
echo '----------------------------'
echo '----------------------------'
read -p  'want to do another service (y/n) : '  loop
while [[ $loop != 'y' && $loop != 'n' ]] 2> /dev/null;
do
read -p  'choose a correct choice (y/n) : '  loop
if [[ $loop == 'y' || $loop == 'n' ]] 2> /dev/null; then
        break

else
        continue
fi
done
if [ $loop == 'y' ] 2> /dev/null; then
        continue
elif [ $loop == 'n' ] 2> /dev/null; then
        break
fi
done

