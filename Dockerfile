FROM nginx:stable
# hadolint ignore=DL4000
LABEL maintainer="Rob Jacobs <jacobs.rob60@hotmail.com>"
MAINTAINER = "jacobs.rob60@hotmail.com"

RUN rm /usr/share/nginx/html/index.html
COPY html/index.html /usr/share/nginx/html

#EXPOSE 80
# EXPOSE 800000
#CMD ["nginx", "-g" , "daemon off;"]
