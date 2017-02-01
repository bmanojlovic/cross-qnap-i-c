cross-qnap-i-c
======
# Container used for Cross compiling for QNAP arm target 
To compile for marvel ARM architecture we can use compiler provided by QNAP

# Building Cross compiler container
Running command in cloned source of this repository
```
docker build -t cross-qnap-i-c 
```
Result of this run should provide you with image like this
```
steki@pc:~/GITHUB/cross-qnap-i-c> docker images cross-qnap-i-c 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
cross-qnap-i-c      latest              72f6a45d39e4        40 minutes ago      619.6 MB
steki@pc:~/GITHUB/cross-qnap-i-c> 
```
This image represents cross compiler installation with prepared run script that will help in compiling
## Example run
In directory in which you want to build source with cross compiler position yourself with `cd source_dir`
```
steki@pc:~/GITHUB/cross-qnap-i-c> ls -la
total 12
drwxr-xr-x  3 steki users  65 Jan 31 17:33 .
drwxr-xr-x 16 steki users 289 Jan 31 17:03 ..
-rwxr-xr-x  1 steki users  60 Jan 31 18:33 call.sh
-rw-r--r--  1 steki users 882 Jan 31 18:21 Dockerfile
-rw-r--r--  1 steki users  83 Jan 31 18:28 test.c
```
run docker session with `pwd` as volume that will be mounted in /tmp/src of container
```
steki@pc:~/GITHUB/cross-qnap-i-c> docker run -v $(pwd):/tmp/src --rm -ti cross-qnap-i-c gcc -o test.arm test.c
```
## Result
After running compiler in current folder you will have result of compilation
```
steki@pc:~/GITHUB/cross-qnap-i-c> ls -la
total 20
drwxr-xr-x  3 steki users   81 Jan 31 17:33 .
drwxr-xr-x 16 steki users  289 Jan 31 17:03 ..
-rwxr-xr-x  1 steki users   60 Jan 31 18:33 call.sh
-rw-r--r--  1 steki users  882 Jan 31 18:21 Dockerfile
-rwxr-xr-x  1 root  root  6491 Jan 31 18:35 test.arm
-rw-r--r--  1 steki users   83 Jan 31 18:28 test.c
```
As can be seen cross compiler has done its work
```
steki@pc:~/GITHUB/cross-qnap-i-c> file test.arm 
test.arm: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.14, not stripped
```
# Who
repository owner? :)
