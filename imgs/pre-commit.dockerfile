FROM python:slim

RUN apt-get update && apt-get install -y git
RUN pip install pre-commit

WORKDIR /project

ENTRYPOINT ["python", "/usr/local/bin/pre-commit"]
