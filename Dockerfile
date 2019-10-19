FROM gcr.io/google-appengine/openjdk


ENV MB_JETTY_PORT 3000
# ENV MB_DB_TYPE mysql
# ENV MB_DB_DBNAME metabase
# ENV MB_DB_PORT 3306
# ENV MB_DB_USER metabase
# ENV MB_DB_PASS metabase
# ENV MB_DB_HOST localhost

WORKDIR /metabase

ARG METABASE_VERSION=0.33.4
ARG METABASE_GPG=2c51589af11f462e070a1d22e0686386b6e09e8142257974ee09c1bcc704d91d


RUN apt-get update && apt-get install -y \
    curl

RUN curl -L -o metabase.jar http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar \
    && echo "${METABASE_GPG} metabase.jar" | sha256sum -c


EXPOSE 3000

COPY run.sh /run.sh

CMD ["/run.sh"]
