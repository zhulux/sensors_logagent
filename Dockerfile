FROM anapsix/alpine-java:8_server-jre_unlimited

ENV TZ=Asia/Shanghai
ENV SENSORS_HOST=''
ENV SENSORS_PORT=''

# Install supervisord
RUN apk --update add supervisor && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && mkdir -p /data/logs
COPY logagent/ /etc/logagent/
COPY ./conf/supervisord.conf /etc/supervisord.conf
COPY ./conf/logagent.conf /etc/logagent.conf

# Env
ADD init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh", "/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
