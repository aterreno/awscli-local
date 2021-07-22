FROM python:3.7-alpine

RUN pip install pip install awscli-local[ver2]

ENTRYPOINT [ "awslocal" ]
CMD []
