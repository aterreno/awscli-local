FROM amd64/python:3-alpine

RUN pip install awscli-local[ver1]

ENTRYPOINT [ "awslocal" ]
CMD []
