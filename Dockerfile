FROM debian:latest

RUN apt-get update && apt-get install -y wget curl telnet

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb_1.2.0_amd64.deb \
  && dpkg -i influxdb_1.2.0_amd64.deb

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_1.2.1_amd64.deb \
  && dpkg -i telegraf_1.2.1_amd64.deb

RUN wget https://dl.influxdata.com/chronograf/releases/chronograf_1.2.0~beta1_amd64.deb \
  && dpkg -i chronograf_1.2.0~beta1_amd64.deb

RUN wget https://dl.influxdata.com/kapacitor/releases/kapacitor_1.2.0_amd64.deb \
  && dpkg -i kapacitor_1.2.0_amd64.deb



RUN apt-get update && apt-get install -y supervisor net-tools

# Configure supervisord
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./telegraf.conf /opt/telegraf/telegraf.conf


EXPOSE  80
EXPOSE 8125/udp
EXPOSE 10000
EXPOSE 8083
EXPOSE 8086
EXPOSE 8088

CMD     ["/usr/bin/supervisord"]
