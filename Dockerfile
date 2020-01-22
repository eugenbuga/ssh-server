FROM openjdk:8u232-jdk
MAINTAINER Corbin Uselton <corbinu@decimal.io>
ENV TERM xterm
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server && \
    apt-get clean
RUN mkdir -p /var/run/sshd \
  && mkdir /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/authorized_keys
COPY bin/* /usr/local/bin/
COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
ENV JAVA_HOME /usr/local/openjdk-8
ENV PATH $JAVA_HOME/bin:$PATH

ENTRYPOINT ["ssh-start"]
CMD ["ssh-server"]
COPY authorized_keys /root/.ssh/authorized_keys
