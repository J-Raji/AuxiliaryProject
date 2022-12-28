#!/bin/bash
userfile=$(cat names.csv)
PASSWORD=password


 if [ $(id -u) -eq 0 ]; then


 for user in $userfile;
    do
            echo $user
        if id "$user" &>/dev/null
        then
            echo "User Exist"
        else


#Add each user in its home directory and each user to developers

useradd -m -d /home/$user -s /bin/bash -g Developers $user
        echo "New User Created"
        echo

#Create ssh directory in home directory

su - -c "mkdir ~/.ssh" $user
        echo ".ssh directory created for new user"
        echo

#Set permission for the ssh directory

su - -c "chmod 700 ~/.ssh" $user
         echo "user permission for .ssh directory set"
         echo

#Create authorized_key file


       su - -c "touch ~/.ssh/authorized_keys" $user
        echo "Authorized Key File Created"
        echo
#Set permission for the key file

su - -c "chmod 600 ~/.ssh/authorized_keys" $user
        echo "user permission for the Authorized Key File set"
        echo

#Create and set the public key for users in the server
(names.csv,public key and the script file)

 cp -R "/home/ubuntu/Shell/id_rsa.pub" "/home/$user/.ssh/authorized_keys"
        echo "Copyied the Public Key to New User Account on the server"
        echo
        echo

        echo "USER CREATED"

#Code generates a PASSWORD

sudo echo -e "$PASSWORD\n$PASSWORD" | sudo passwd "$user"
sudo passwd -e $user
            fi
        done
    else
    echo "Only Admin Can Onboard A User"
    fi
        


    