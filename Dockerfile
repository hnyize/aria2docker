FROM alpine
MAINTAINER hnyize <hainanyize@qq.com>
RUN apk update &&  \
    apk add nginx &&  \
    apk add aria2
RUN mkdir -p /var/run/nginx  &&  \
    touch /var/run/nginx/nginx.pid
RUN mkdir /download
COPY webUI /usr/local/
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 80
CMD /run.sh