#!/bin/bash

useradd -m -d /home/MasterH MasterH
useradd -m -d /home/Hertz Hertz
useradd -m -d /home/Heisenberg Heisenberg
useradd -m -d /home/Holland Holland

counter=1
inclname="Hertz-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    usermod -a -G $inclname$counter Hertz
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))
done

counter=1
inclname="Heisenberg-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    usermod -a -G $inclname$counter Heisenberg
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))

done

counter=1
inclname="Holland-Intern"

while [ $counter -le 20 ]; do
    useradd -m -d /home/$inclname$counter $inclname$counter
    usermod -a -G $inclname$counter Holland
    usermod -a -G $inclname$counter MasterH
    counter=$((counter+1))
done

echo "Users Created!"

counter=1
inclname="Hertz-Intern"

while [ $counter -le 20 ]; do
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

counter=1
inclname="Heisenberg-Intern"

while [ $counter -le 20 ]; do
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

counter=1
inclname="Holland-Intern"

while [ $counter -le 20 ]; do
    chmod -R u-x,g+rwx,o-rwx /home/$inclname$counter
    counter=$((counter+1))
done

usermod -a -G Holland,Hertz,Heisenberg MasterH

chmod -R u+rwx,g+rwx,o-rwx /home/Hertz

chmod -R u+rwx,g+rwx,o-rwx /home/Heisenberg

chmod -R u+rwx,g+rwx,o-rwx /home/Holland

echo "Permissions Assigned!"

counter=1
tcount=1
while [ $counter -le 20 ]; do
    while [ $tcount -le 5 ]; do
        mkdir /home/Hertz-Intern$counter/task$tcount
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
        chown -R Holland-Intern$counter:Holland-Intern$counter /home/Holland-Intern$counter/task$tcount
        tcount=$((tcount+1))
    done
    tcount=1
    counter=$((counter+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Hertz/task$tcount
    chown -R Hertz:Hertz /home/Hertz/task$tcount
    tcount=$((tcount+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Heisenberg/task$tcount
    chown -R Heisenberg:Heisenberg /home/Heisenberg/task$tcount
    tcount=$((tcount+1))
done

tcount=1
while [ $tcount -le 5 ]; do
    mkdir /home/Holland/task$tcount
    chown -R Holland:Holland /home/Holland/task$tcount
    tcount=$((tcount+1))
done

echo "Folders Created!"

counter=1
tcount=1
while [ $tcount -le 5 ]; do
    cd /home/Hertz/task$tcount
    while [ $counter -le 50 ]; do
        touch Hertz_task$counter.txt
        dd if=/dev/urandom of=Hertz_task$counter.txt bs=128 count=1
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
        touch Heisenberg_task$counter.txt
        dd if=/dev/urandom of=Heisenberg_task$counter.txt bs=128 count=1
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
        touch Holland_task$counter.txt
        dd if=/dev/urandom of=Holland_task$counter.txt bs=128 count=1
        chown Holland:Holland Holland_task$counter.txt
        counter=$((counter+1))
    done
    counter=1
    tcount=$((tcount+1))
done

echo "Files Created!"