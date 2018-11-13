FROM alpine
MAINTAINER hnyize <hainanyize@qq.com>
RUN apk update &&  \
    apk add nginx &&  \
    apk add aria2
RUN mkdir -p /var/run/nginx  &&  \
    touch /var/run/nginx/nginx.pid
COPY webUI /usr/local/
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh