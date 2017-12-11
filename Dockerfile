FROM alpine:latest
MAINTAINER Gustavo <Nips> S.

EXPOSE 1080

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update --no-cache add openvpn dante-server runit
RUN rm -rf /var/cache/

COPY app /app
COPY etc /etc

RUN chmod u+x /app/ovpn/run /app/sockd.sh

ENV REGION="" \
	USERNAME="" \
	PASSWORD=""

CMD ["runsvdir", "/app"]
