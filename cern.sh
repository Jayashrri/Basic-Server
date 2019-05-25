#!/bin/bash

#Create Master and Scientist Users
useradd -m -d /home/MasterH MasterH
useradd -m -d /home/Hertz Hertz
useradd -m -d /home/Heisenberg Heisenberg
useradd -m -d /home/Holland Holland

#Create Intern Users
#counter --> Intern Number
counter=1
inclname="Hertz-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    #Add Hertz and MasterH to Intern's Group
    usermod -a -G $inclname$counter Hertz
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))
done

counter=1
inclname="Heisenberg-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    #Add Heisenberg and MasterH to Intern's Group
    usermod -a -G $inclname$counter Heisenberg
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))

done

counter=1
inclname="Holland-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    #Add Holland and MasterH to Intern's Group
    usermod -a -G $inclname$counter Holland
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))
done

echo "Users Created!"

#Assigning Permissions to Users
#counter --> Intern Number
counter=1
inclname="Hertz-Intern"

while [ $counter -le 20 ]; do
    #RW for Intern, RWX for Hertz and MasterH, None for Others
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

counter=1
inclname="Heisenberg-Intern"

while [ $counter -le 20 ]; do
    #RW for Intern, RWX for Heisenberg and MasterH, None for Others
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

counter=1
inclname="Holland-Intern"

while [ $counter -le 20 ]; do
    #RW for Intern, RWX for Holland and MasterH, None for Others
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

#Add MasterH to Scientists' Groups
usermod -a -G Holland,Hertz,Heisenberg MasterH

#RWX for Corresponding Scientist, RWX for MasterH, None for Others
chmod -R u+rwx,g+rwx,o-rwx /home/Hertz
chmod -R u+rwx,g+rwx,o-rwx /home/Heisenberg
chmod -R u+rwx,g+rwx,o-rwx /home/Holland

echo "Permissions Assigned!"

#Creating Task Directories
#counter --> Intern Number
#tcount --> Task Folder Number
counter=1
tcount=1
while [ $counter -le 20 ]; do
    while [ $tcount -le 5 ]; do
        mkdir /home/Hertz-Intern$counter/task$tcount
        #Change ownership to corresponding Intern and Intern's Group
        chown -R Hertz-Intern$counter:Hertz-Intern$counter /home/Hertz-Intern$counter/task$tcount
        tcount=$((tcount+1))
    done
    tcount=1
    counter=$((counter+1))
done

counter=1
tcount=1
while [ $counter -le 20 ]; do
    while [ $tcount -le 5 ]; do
        mkdir /home/Heisenberg-Intern$counter/task$tcount
        #Change ownership to corresponding Intern and Intern's Group
        chown -R Heisenberg-Intern$counter:Heisenberg-Intern$counter /home/Heisenberg-Intern$counter/task$tcount
        tcount=$((tcount+1))
    done
    tcount=1
    counter=$((counter+1))
done

counter=1
tcount=1
while [ $counter -le 20 ]; do
    while [ $tcount -le 5 ]; do
        mkdir /home/Holland-Intern$counter/task$tcount
        #Change ownership to corresponding Intern and Intern's Group
        chown -R Holland-Intern$counter:Holland-Intern$counter /home/Holland-Intern$counter/task$tcount
        tcount=$((tcount+1))
    done
    tcount=1
    counter=$((counter+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Hertz/task$tcount
    #Change ownership to Hertz
    chown -R Hertz:Hertz /home/Hertz/task$tcount
    tcount=$((tcount+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Heisenberg/task$tcount
    #Change ownership to Heisenberg
    chown -R Heisenberg:Heisenberg /home/Heisenberg/task$tcount
    tcount=$((tcount+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Holland/task$tcount
    #Change ownership to Holland
    chown -R Holland:Holland /home/Holland/task$tcount
    tcount=$((tcount+1))
done

echo "Folders Created!"

#Create Task Files
#counter --> Task File Number
#tcount --> Task Folder Number
counter=1
tcount=1
while [ $tcount -le 5 ]; do
    cd /home/Hertz/task$tcount
    while [ $counter -le 50 ]; do
        #Create file and fill with 128 random characters
        touch Hertz_task$counter.txt
        dd if=/dev/urandom of=Hertz_task$counter.txt bs=128 count=1
        #Change ownership to Hertz
        chown Hertz:Hertz Hertz_task$counter.txt
        counter=$((counter+1))
    done
    counter=1
    tcount=$((tcount+1))
done

counter=1
tcount=1
while [ $tcount -le 5 ]; do
    cd /home/Heisenberg/task$tcount
    while [ $counter -le 50 ]; do
        #Create file and fill with 128 random characters
        touch Heisenberg_task$counter.txt
        dd if=/dev/urandom of=Heisenberg_task$counter.txt bs=128 count=1
        #Change ownership to Heisenberg
        chown Heisenberg:Heisenberg Heisenberg_task$counter.txt
        counter=$((counter+1))
    done
    counter=1
    tcount=$((tcount+1))
done

counter=1
tcount=1
while [ $tcount -le 5 ]; do
    cd /home/Holland/task$tcount
    while [ $counter -le 50 ]; do
        #Create file and fill with 128 random characters
        touch Holland_task$counter.txt
        dd if=/dev/urandom of=Holland_task$counter.txt bs=128 count=1
        #Change ownership to Holland
        chown Holland:Holland Holland_task$counter.txt
        counter=$((counter+1))
    done
    counter=1
    tcount=$((tcount+1))
done

echo "Files Created!"

#Create script file for copying random Task File to Intern's Task Folders
#Store created script file in MasterH's home directory
dpath="/home/MasterH/copysched.txt"
echo "#!/bin/bash
#counter --> Intern Number
#tcount --> Task Folder Number
counter=1
tcount=1
range=50
while [ \$counter -le 20 ]; do
    while [ \$tcount -le 5 ]; do
        #Generate Random Number within 1-50
        result=\$RANDOM
        result=\$((result%range +1))
        cp /home/Hertz/task\$tcount/Hertz_task\$result.txt /home/Hertz-Intern\$counter/task\$tcount
        #Change ownership to Hertz and corresponding Intern's Group
        chown Hertz:Hertz-Intern\$counter /home/Hertz-Intern\$counter/task\$tcount/Hertz_task\$result.txt
        #Add sticky bit to copied Task File
        chmod +t /home/Hertz-Intern\$counter/task\$tcount/Hertz_task\$result.txt
        tcount=\$((tcount+1))
    done
    tcount=1
    counter=\$((counter+1))
done

counter=1
tcount=1
while [ \$counter -le 20 ]; do
    while [ \$tcount -le 5 ]; do
        #Generate Random Number within 1-50
        result=\$RANDOM
        result=\$((result%range +1))
        cp /home/Heisenberg/task\$tcount/Heisenberg_task\$result.txt /home/Heisenberg-Intern\$counter/task\$tcount
        #Change ownership to Heisenberg and corresponding Intern's Group
        chown Heisenberg:Heisenberg-Intern\$counter /home/Heisenberg-Intern\$counter/task\$tcount/Heisenberg_task\$result.txt
        #Add sticky bit to copied Task File
        chmod +t /home/Heisenberg-Intern\$counter/task\$tcount/Heisenberg_task\$result.txt
        tcount=\$((tcount+1))
    done
    tcount=1
    counter=\$((counter+1))
done

counter=1
tcount=1
while [ \$counter -le 20 ]; do
    while [ \$tcount -le 5 ]; do
        #Generate Random Number within 1-50
        result=\$RANDOM
        result=\$((result%range +1))
        cp /home/Holland/task\$tcount/Holland_task\$result.txt /home/Holland-Intern\$counter/task\$tcount
        #Change ownership to Holland and corresponding Intern's Group
        chown Holland:Holland-Intern\$counter /home/Holland-Intern\$counter/task\$tcount/Holland_task\$result.txt
        #Add sticky bit to copied Task File
        chmod +t /home/Holland-Intern\$counter/task\$tcount/Holland_task\$result.txt
        tcount=\$((tcount+1))
    done
    tcount=1
    counter=\$((counter+1))
done" >$dpath

#Add Created Script to Crontab and set frequency to run Daily
(crontab -l ; echo "@daily $dpath") | sort - | uniq - | crontab -

echo "File Copying Scheduled!"