
#Barabone OS alpine linux,provide the smaller size of the docker image
FROM node:10.15.3-alpine

ENV PORT 8080
ENV TOKEN_EXPIRES_IN 24h

# to prevent the container run as root, in ubuntu
# RUN groupadd -g 999 appuser && \
#   useradd -r -u 999 -g appuser appuser
# USER appuser

# set working directory with root permission #mkdir -p to create subdirectory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install

#RUN npm install -g @angular/cli@7.3.8

# add app
COPY . /usr/src/app

# to prevent the container run as root
RUN addgroup -S appuser
RUN adduser -S appuser -G appuser
USER appuser

# start app
# CMD ["ng","serve","--ssl","true","--host","0.0.0.0"] #for https deployment
# CMD ["ng","serve","--proxy-config","proxy.conf.json","--host","0.0.0.0"]
CMD ["ng","serve","--host","0.0.0.0"]
