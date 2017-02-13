FROM ubuntu:16.04

RUN apt-get update && apt-get install -y sqlite3

CMD ["/bin/bash", "-c", "sleep 5 & wait"]