FROM python:3

RUN pip install apprise j2cli
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
