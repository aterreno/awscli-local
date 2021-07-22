FROM python:3.7-alpine

RUN pip install awscli-local[ver1]

ENTRYPOINT [ "awslocal" ]
CMD []
