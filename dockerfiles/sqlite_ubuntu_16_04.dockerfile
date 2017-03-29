FROM ubuntu:16.04

RUN apt-get update && apt-get install -y sqlite3
RUN mkdir /db
RUN /usr/bin/sqlite3 /db/sandbox.db

ENTRYPOINT ["tail", "-f", "/dev/null"]
