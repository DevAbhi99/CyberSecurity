#NMAP is a poweful vulnerability scanner tool which is used in scanning the target host (IP address or the host)


#install nmap
apt-get install nmap

#Commands

#1) We can do basic scan where the ip address or the host is scanner for open or vulnerable ports and by default first 1000 ports are scanned. 
#The approach is that the source sends half tcp communication syn message and then does not respond to the syn ack message of the target host

nmap <DNS name> or <ip address>

#2) -sS scan

nmap -sS <ip address> # It does the same thing as the basic scan

#3) -p scan

# It is used in scanning vulnerable ports of the target ip address. 

#a) Scanning ip address on selected ports

nmap -p 80,443 <ipaddress>

#b) Scanning range of ports

nmap -p 1-1000 <ipaddress>  #Scans the ip address on a range of ip address 1-1000 in this case

#c) Scanning range of ip address

nmap 192.168.1.1-20  #will scan from 192.168.1.1 to 192.168.1.1

#d) Scanning the subnet or the CIDR (Classless Intra Domain Routing)

nmap 192.168.1.1/24

#4) -sn scan

#It doesnt scan for ports but scans if the host is up which is the foremost thing to do in cyber security

nmap -sn <target id address>

#5) -O scan

#Scans the operating system associated with the target address. Usually signatures are fetched on the basis of open and closed ports (pattern analysis)

nmap -O <target>

#6) -sV scan

#Scans the service running on the target ip address or host

nmap -sV <target>

#7) -A scan

#It is used in aggressive scanning of the host which does a copule of actions of other scan flags like scanning ports, services, oses and running nce scripts and running traceroute (To track the complete journey of packets from source to destination)

nmap -A <target IP address>

#8) -sT scan

#It is used in sending tcp packets while scanning for the target host. Never use this scan because the source completes the whole 3 way handshake with client and a connection is established and the informarmation of the attacker is stored in the log or IDS can easily detect the attacker

nmap -sT <target>

#9) -sU scan

#It sends UDP packets Not really affective nmap scan and usually packets are lost while using this scan

nmap -sU <target>


#10) storing results of nmap

#a) -oN :- stores results in normal text

nmap -p 80 <target> -oN result  #Stores in txt format

#b) -oX :- stores in xml format

nmap -p 80 <target> -oX result.xml

#c) -oA :- stores in all format

nmap -p 80 <target> -oA res


#11) template based scanning

#a) -T0
#b) -T1
#c)-T3
#d) -T4
#e) -T5

#As the time increases in ascending order the the packets are sent quickly leading to packet loss or quick detection by IDS and blocking. T0 and T1 are the stealthier templates

nmap -p 80 -T1 <target host> 

#12) NSE:- It stands for NMAP script engine which makes nmap more than just a port scanner. NSE makes NMAP a mini cyber sec framework to scan for vulnerabilities

#a) -sC scan - It is used for basic scan of the target host used for checking basic info, protocols check or banner grabbing

nmap -sC <target>

#b) --script=vuln scan it used to check for vulnerability and only used on target apps where you are authorized to perform the scan

nmap --script=vuln <target host>

#c) --script=http-<mode> used for getting http information

nmap --script=http-enum <targethost>
nmap --script=http-headers <targethost>
nmap --script=http-title <targethost>


#12) Advanced Evasion strategies to save myself from IDS/firewalls (Do not use on random urls only on owned linux systems)

#a) Decoying:- it is like hiding in a group where the attacker confuses the IDS logs with multiple IP addresses

nmap -sS -D <Fake IP>,<Fake IP>,ME <target ip>

#b) Fragmenting:- breaking the packets into smaller pieces. Liek suppose the firewall is configured in such a way that it does not allow big chunk of packets for example if we want to send payload to harm the system then we can send packets in smaller chunks to confuse the firewall

nmap -sS -f <target ip>  #Default breaking of packets into random bits of smaller chunks

nmap -sS --mtu 16 <target ip> #I can control or specify the size of chunks that the packet will split into

#c) spoofing the port. Suppose the firewall accepts request only from certain ports then I can fake the source port of the attacker

nmap -sS --source-port 53 <target ip>  #suppose the firewall accepts from port 53 i told the target the my source port is 53 and the firewall will eblieve it
