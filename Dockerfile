
# s2i-mattermost
FROM openshift/base-centos7

MAINTAINER Christoph Görn <goern@b4mad.net>

ENV MATTERMOST_VERSION 3.1.0

LABEL io.k8s.description="Mattermost is an open source, self-hosted Slack-alternative" \
      io.k8s.display-name="Mattermost 3.1.0 builder" \
      io.openshift.expose-services="8065:mattermost" \
      io.openshift.tags="builder,mattermost,slack"

LABEL Component="mattermost" \
      Name="goern/s2i-mattermost-310-centos7" \
      Version="3.1.0" \
      Release="1"

RUN yum update -y --setopt=tsflags=nodocs && \
    yum install -y --setopt=tsflags=nodocs tar && \
    yum clean all -y

RUN cd /opt && \
    curl -LO https://releases.mattermost.com/3.1.0/mattermost-team-3.1.0-linux-amd64.tar.gz && \
    tar xf mattermost-team-3.1.0-linux-amd64.tar.gz &&\
    rm mattermost-team-3.1.0-linux-amd64.tar.gz && \
    mkdir /opt/mattermost/data && \
    chmod 777 /opt/mattermost/logs/ /opt/mattermost/data

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/mattermost

USER 1001
WORKDIR /opt/mattermost

EXPOSE 8065

CMD ["usage"]
