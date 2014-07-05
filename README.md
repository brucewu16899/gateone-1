Gateone 


http://askubuntu.com/questions/416907/ufw-not-blocking-connections-to-docker-instance
I had the same problem and resolved it by using IPTABLES instead.

Example to only allow 3306 from source ip xxx.xxx.xxx.xxx:

Adds an accept for source matching our ip to line 1 of the FORWARD chain

iptables -I FORWARD 1 -p tcp -i eth0 -s xxx.xxx.xxx.xxx --dport 3306 -j ACCEPT

Drops all other connections on the FORWARD chain for that port

iptables -I FORWARD 2 -p tcp -i eth0 --dport 3306 -j DROP

Using the line numbers (1 & 2) forces the rules to be added above the ones created by docker such as:

-A FORWARD -d 0.0.0.0/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport 3306 -j ACCEPT



http://comments.gmane.org/gmane.comp.sysutils.docker.user/253
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


https://groups.google.com/forum/#!topic/docker-user/lUPQXM41DPM
iptables -A FORWARD -i eth0 --dport 49000:49999 -j DROP
