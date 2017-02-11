docker build -t mefellows/tick .

sudo docker run -d -p 8086:8086 -p 8125:8125/udp  -p 8888:8888 -p 9092:9092  --name tick mefellows/tick

sudo docker exec -i -t tick curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE telegraf" 

The dashborad can be seen at port <machine>:8888
