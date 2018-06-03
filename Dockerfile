FROM jboss/keycloak:3.2.1.Final
MAINTAINER Bixlabs, eddsuarez@bixlabs.com

USER root

ADD openshift-entrypoint.sh /usr/bin/
ADD start-keycloak.sh /usr/bin/
#ADD theme/base/login/html/*.ftl /opt/jboss/keycloak/themes/base/login/
#ADD theme/base/email/messages/*.properties /opt/jboss/keycloak/themes/base/email/messages/
#ADD theme/keycloak/login/resources/css/*.css /opt/jboss/keycloak/themes/keycloak/login/resources/css/

#Give correct permissions when used in an OpenShift environment.
RUN chown -R jboss:0 $JBOSS_HOME/standalone && \
    chmod -R g+rw $JBOSS_HOME/standalone && \
    chown -R jboss:0 $JBOSS_HOME/modules/system/layers/base && \
    chmod -R g+rw $JBOSS_HOME/modules/system/layers/base && \
    chown -R jboss:0 /tmp && \
    chmod -R g+rw /tmp

USER 1000

ENTRYPOINT [ "/usr/bin/openshift-entrypoint.sh" ]

CMD ["/usr/bin/start-keycloak.sh", "-b", "0.0.0.0"]
