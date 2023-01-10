FROM node:18
MAINTAINER Dan Lynn <docker@danlynn.org>

# ember server on port 4200, livereload server on port 49152, debug on 9229
EXPOSE 4200 49152 9229
WORKDIR /apps

ENV TERM=xterm

#RUN apk update && apk upgrade && apk add --no-cache git
#RUN sysctl fs.inotify.max_user_watches=524288

RUN \
	npm install -g ember-cli

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  python-dev &&\
	rm -rf /var/lib/apt/lists/*

# Note: See the README.md to find out how to increase the fs.inotify.max_user_watches value so that watchman will work better with ember projects.
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v4.7.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

COPY ember.run.sh /usr/local/bin/ember.run.sh
RUN chmod 755 /usr/local/bin/ember.run.sh
	
# run ember server on container start
CMD ["/usr/local/bin/ember.run.sh"]
