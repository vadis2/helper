````
To find:
sudo ss -lptn 'sport = :8082'
or
lsof -i :8082

chrome   2256 vadis  150u  IPv6 214889      0t0  TCP ip6-localhost:48326->ip6-localhost:8082 (ESTABLISHED)
node    10094 vadis   13u  IPv6 208778      0t0  TCP *:8082 (LISTEN)
node    10094 vadis   15u  IPv6 215368      0t0  TCP ip6-localhost:8082->ip6-localhost:48326 (ESTABLISHED)

To kill:
sudo kill -9 <PID>
sudo kill -9 10094

````
