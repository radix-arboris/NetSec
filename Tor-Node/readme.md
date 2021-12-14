### Relay Node Setup
[src1]()

### Node Configuration Notes


[about relay ops](https://community.torproject.org/relay/)
[tech setup](https://community.torproject.org/relay/setup/)

Before turning your non-exit relay into an exit relay, ensure that you have set a reverse DNS record (PTR) to make it more obvious that this is a tor exit relay. Something like "tor-exit" in its name is a good start.

If your provider offers it, make sure your WHOIS record contains clear indications that this is a Tor exit relay.

Do use a domain name that you own. Definitely do not use torproject.org as a domain name for your reverse DNS.

**To become an exit relay** change ExitRelay from 0 to 1 in your torrc configuration file and restart the tor daemon.



### Router
[src](https://www.alexanderjsingleton.com/how-to-make-a-tor-router-with-the-raspberry-pi-3/)
