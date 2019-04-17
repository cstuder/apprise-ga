FROM python:3.7-alpine

LABEL "com.github.actions.name"="Apprise Push Notifications"
LABEL "com.github.actions.description"="Send a push notification via a series of different services"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/cstuder/apprise-ga"
LABEL "homepage"="https://github.com/cstuder/apprise-ga"
LABEL "maintainer"="Christian Studer <cstuder@existenz.ch>"

RUN pip install apprise j2cli
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
