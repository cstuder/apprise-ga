FROM python:3.8-alpine

RUN pip install apprise j2cli
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
