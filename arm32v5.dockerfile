FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v5/python:3-slim

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-${arch}.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
RUN pip install awscli-local

ENTRYPOINT [ "awslocal" ]
CMD []
