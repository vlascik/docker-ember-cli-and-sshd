# taken from https://github.com/macropin/docker-sshd
FROM alpine:latest

MAINTAINER Vladimir Lascik <vlascik@gmail.com>

ENV TERM=xterm

RUN apk update && \
	#git
    apk add bash openssh rsync && \
    mkdir -p ~/.ssh && chmod 700 ~/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    # to enable connection from IntelliJ & co, JSCh <= 0.1.54 has a problem to connect to sshd otherwise
    echo -e "KexAlgorithms diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,curve25519-sha256@libssh.org\n" >> /etc/ssh/sshd_config && \
	# to enable root logins with a key
	echo -e "PermitRootLogin without-password\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

EXPOSE 22

COPY sshd.entrypoint.sh /sshd.entrypoint.sh
COPY sshd.run.sh /sshd.run.sh
RUN chmod 700 /sshd.entrypoint.sh && chmod 700 /sshd.run.sh

COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys

CMD ["/sshd.run.sh"]
