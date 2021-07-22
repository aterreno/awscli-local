FROM python:3.7-alpine

pip install pip install awscli-local[ver2]
CMD ["awslocal", "help"]
