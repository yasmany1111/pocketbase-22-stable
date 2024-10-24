FROM alpine:3.20

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ARG PB_VERSION=0.22.22

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
