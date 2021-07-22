FROM amd64/python:3-alpine

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-${arch}.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
RUN pip install awscli-local

ENTRYPOINT [ "awslocal" ]
CMD []
