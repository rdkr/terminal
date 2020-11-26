FROM python:slim

RUN pip install aws-sam-cli

RUN mkdir /aws
WORKDIR /aws

ENTRYPOINT ["sam"]
