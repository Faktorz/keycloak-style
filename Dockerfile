FROM jboss/keycloak-openshift:3.3.0.Final
MAINTAINER Bixlabs, eddsuarez@bixlabs.com

USER root

RUN mkdir -p /opt/jboss/keycloak/themes/faktorz/login/resources/css
ADD theme/faktorz/login/*.ftl /opt/jboss/keycloak/themes/faktorz/login/
ADD theme/faktorz/login/*.properties /opt/jboss/keycloak/themes/faktorz/login/

USER 1000

ENTRYPOINT [ "openshift-entrypoint.sh" ]

CMD ["start-keycloak.sh", "-b", "0.0.0.0"]
