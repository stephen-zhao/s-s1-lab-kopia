FROM        kopia/kopia:latest

COPY        start-kopia-server.sh /bin

RUN         chmod a+x /bin/start-kopia-server.sh

ENTRYPOINT  ["/bin/bash"]

