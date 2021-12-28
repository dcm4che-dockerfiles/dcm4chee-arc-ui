FROM dcm4che/wildfly:ffmpeg-24.0.1-15.1.0

ENV DCM4CHEE_ARC_VERSION 5.25.1

RUN cd $JBOSS_HOME \
    && cd /docker-entrypoint.d/deployments \
    && curl -fO http://maven.dcm4che.org/org/dcm4che/dcm4chee-arc/dcm4chee-arc-ui2/${DCM4CHEE_ARC_VERSION}/dcm4chee-arc-ui2-${DCM4CHEE_ARC_VERSION}-secure.war

COPY setenv.sh /
COPY configuration /docker-entrypoint.d/configuration

# Default configuration: can be overridden at the docker command line
ENV KEYSTORE=/opt/wildfly/standalone/configuration/keystores/key.p12 \
    KEYSTORE_TYPE=PKCS12 \
    TRUSTSTORE=/opt/java/openjdk/lib/security/cacerts \
    TRUSTSTORE_TYPE=JKS \
    EXTRA_CACERTS=/opt/wildfly/standalone/configuration/keystores/cacerts.p12
