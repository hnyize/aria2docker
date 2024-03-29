FROM alpine
MAINTAINER hnyize <hainanyize@qq.com>
RUN apk add --no-cache tini wget
RUN apk update &&  \
    apk add nginx &&  \
    apk add aria2
RUN mkdir -p /var/run/nginx  &&  \
    touch /var/run/nginx/nginx.pid
RUN mkdir /download
COPY webUI /usr/local/webUI/
COPY run.sh /run.sh
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /run.sh && chmod 777 /download
RUN mkdir -p /root/.cache/aria2
COPY dht.dat /root/.cache/aria2/
EXPOSE 88
EXPOSE 6800
EXPOSE 6881:6999
ENTRYPOINT ["/sbin/tini","--","/run.sh"]
