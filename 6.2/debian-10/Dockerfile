FROM amazonlinux:2.0.20220406.1

COPY prebuildfs /
# Install required system packages and dependencies
RUN yum install -y tar wget gzip make gcc acl ca-certificates curl procps openssl
RUN mkdir redis-build

WORKDIR redis-build
RUN wget https://download.redis.io/releases/redis-6.2.7.tar.gz
RUN tar -xf redis-6.2.7.tar.gz
RUN cd redis-6.2.7 && make distclean && make PREFIX=/opt/bitnami/redis-sentinel install
RUN mkdir -p /opt/bitnami/redis-sentinel/etc
RUN cp /redis-build/redis-6.2.7/sentinel.conf /opt/bitnami/redis-sentinel/etc/sentinel.conf
RUN chmod g+rwX /opt/bitnami

COPY rootfs /
RUN /opt/bitnami/scripts/redis-sentinel/postunpack.sh
ENV APP_VERSION="6.2.7" \
    BITNAMI_APP_NAME="redis-sentinel" \
    PATH="/opt/bitnami/redis-sentinel/bin:/opt/bitnami/common/bin:$PATH"

EXPOSE 26379

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/redis-sentinel/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/redis-sentinel/run.sh" ]
