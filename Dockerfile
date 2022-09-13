FROM dcm4che/wildfly:ffmpeg-26.1.2-19.0.1

ENV DCM4CHEE_ARC_VERSION 5.28.0

RUN cd $JBOSS_HOME \
    && cd /docker-entrypoint.d/deployments \
    && curl -fO https://www.dcm4che.org/maven2/org/dcm4che/dcm4chee-arc/dcm4chee-arc-ui2/${DCM4CHEE_ARC_VERSION}/dcm4chee-arc-ui2-${DCM4CHEE_ARC_VERSION}-secure.war \
    && chown wildfly:wildfly *

COPY setenv.sh /
COPY --chown=wildfly:wildfly configuration /docker-entrypoint.d/configuration

# Default configuration: can be overridden at the docker command line
ENV KEYSTORE=/opt/wildfly/standalone/configuration/keystores/key.p12 \
    KEYSTORE_TYPE=PKCS12 \
    TRUSTSTORE=/opt/java/openjdk/lib/security/cacerts \
    TRUSTSTORE_TYPE=JKS \
    EXTRA_CACERTS=/opt/wildfly/standalone/configuration/keystores/cacerts.p12
