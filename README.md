# Mini Project 1 of Linux Systems and Software Development [CSIE6813] @ NCKU Spring 2023

## Lab 1 - Customize Command Line Prompt

Goals:

1. Change the color of command line prompt from green to yellow.
2. Extend the hostname in command line prompt with studnet ID.
3. Replace `$` in command line prompt with `#`.

## Lab 2 - Shell Script

Decompress `Linux_Week5_Lab.zip`, which contains the following directories and files:

```cmd!
Linux_Week5_Lab/
├── compressed_files/
│   └── /* contains 10000 .zip, .tar.gz, .rar, and .dika with the file name of student id */
└── student_id
```

Write a shell script that can perform the following tasks:

1. create a `missing_list.txt` to list those student IDs that are listed in `student_id` but files with name of the student ID doesn't exist in the `compressed_files/`.
2. create a `wrong_list.txt` to list those students who submited files in wrong file extension, that is `.dika` file.
3. create `zip`, `rar`, `tar.gz`, and `unknown` folders under the `compressed_files` directory, and move `.zip`, `.rar`, `.tar.gz`, and `.dika` to those folders, respectively
4. Decompress `.zip`, `.rar`, and `.tar.gz`.

Project structure should look like this:

```cmd!
Linux_Week5_Lab/
├── compressed_files/
│   ├── zip/
│   ├── rar/
│   ├── tar.gz/
│   └── unknown/
├── student_id
├── missing_list.txt
├── wrong_list.txt
└── my_script.sh
```

## Solution to Lab 1

### Change the Color of Command Line Prompt from Green to Yellow

Use `vim` to open `.bashrc`:

```cmd
$ vim ~/.bashrc
```

Find the following content:

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

Modify it to the following one:

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
```

Execute the following command and the color of command line prompt will change immediately

```cmd
$ source ~/.bashrc
```

### Extend the Hostname in Command Line Prompt with Your Studnet ID

Modify `hostname`:

```cmd
$ sudo vim /etc/hostname
```

Modify `/etc/hosts`:

```cmd
$ sudo vim /etc/hosts
```

Lastly, restart computer

### Replace `$` with `#`

Use `vim` to open `.bashrc`:

```cmd
$ vim ~/.bashrc
```

Find the following content:

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
```

Modify it to the following one:

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]# '
```

Execute the following command and the command line prompt will change immediately

```cmd
$ source ~/.bashrc
```

## Solution to Lab 2

### Install Decompress Tools

```cmd
$ sudo apt install tar unzip unrar
```

### Execute `my_script.sh`

Put `my_script.sh` under `Linux_Week5_Lab` directory and use the following command to execute the script

```cmd
$ ./my_script.sh
```