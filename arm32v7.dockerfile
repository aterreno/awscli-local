FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


FROM arm32v7/python:3-alpine

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

RUN pip install awscli-local[ver1]

ENTRYPOINT [ "awslocal" ]
CMD []