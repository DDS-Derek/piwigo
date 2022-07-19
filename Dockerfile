FROM ddsderek/foundations:Debain-nginx1.18.0-php7.4-nostart

ENV TAG=12.3.0

COPY start.sh /

WORKDIR /

RUN apt-get update && \
    apt-get install -y wget zip && \
    wget https://cn.piwigo.org/download/dlcounter.php?code=${TAG} -O piwigo.zip && \
    unzip piwigo.zip && \
    mv /piwigo /web && \
    cp -r /web /app && \
    rm -rf /piwigo.zip && \
    apt-get remove -y wget zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 755 /start.sh

WORKDIR /app/web

CMD [ "/start.sh" ]