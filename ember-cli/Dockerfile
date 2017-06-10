#FROM node:7-alpine
# alpine has trouble compiling watchman (no glibc), can be added by buildpack, but then the container is bigger than ubuntu
#build libc env: https://github.com/praekeltfoundation/alpine-buildpack-deps/blob/develop/slim/Dockerfile

FROM node:7
MAINTAINER Dan Lynn <docker@danlynn.org>

# ember server on port 4200, livereload server on port 49152, debug on 5858
EXPOSE 4200 49152 5858
WORKDIR /apps

ENV TERM=xterm

#RUN apk update && apk upgrade && apk add --no-cache git
#RUN sysctl fs.inotify.max_user_watches=524288

RUN \
	npm install -g ember-cli@2.14.0-beta.2 &&\
	npm install -g bower &&\
	npm install -g phantomjs

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  python-dev &&\
	rm -rf /var/lib/apt/lists/*

# Note: See the README.md to find out how to increase the fs.inotify.max_user_watches value so that watchman will work better with ember projects.
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	#git checkout v3.5.0 &&\
	git checkout v4.7.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

COPY ember.run.sh /usr/local/bin/ember.run.sh
RUN chmod 755 /usr/local/bin/ember.run.sh
	
# run ember server on container start
CMD ["/usr/local/bin/ember.run.sh"]
