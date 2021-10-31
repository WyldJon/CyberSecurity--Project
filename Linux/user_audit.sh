#!/bin/bash


users_added=()
users_removed=()

#Inputs list of previous users from file saved at the end of script
previous_user_list=($(<users_list.txt))

#Builds list of current users
current_user_list=($(cat /etc/passwd | awk -F: '{ if ($3 >= 1000) print $1}'))

#Creates an array with the difference between current users and past users lists
difference_list=($(echo ${current_user_list[@]} ${previous_user_list[@]} | tr ' ' '\n' | sort | uniq -u))

#Sorts the changes to users into either users added array or users removed array
for user in ${difference_list[@]}
do
	for current_user in ${current_user_list[@]}
	do
		if [ $user == $current_user ]
		then
			users_added+=($user)
		fi
	done

	for previous_user in ${previous_user_list[@]}
	do
		if [ $user == $previous_user ]
		then 
			users_removed+=($user)
		fi
	done
done 

#Displays if users have been added or removed
if [ ${#users_added[@]} -gt 0 ] || [ ${#users_removed[@]} -gt 0 ]
then
	if [ ${#users_added[@]} -gt 0 ]
	then	
		echo -e "Here are the users that have been added:\n ${users_added[@]}\n"
	fi
	if [ ${#users_removed[@]} -gt 0 ]
	then
		echo -e "Here are the users that have been removed:\n ${users_removed[@]}\n"
	fi
else 
	echo -e "There have been no changes to users.\n"
fi

#Prompts to lock users that have been added
echo "Would you like to lock any users [Y/N]" ; read response
while [ $response == 'y' ]
do
	echo "Which user would you like to lock?" ; read user_lock
	sudo usermod -L $user_lock
	echo "Would you like to lock any other users? [Y/N]" ; read response
done



#Stores current list of users to be compared when script is ran next time
echo ${current_user_list[@]} > users_list.txt
