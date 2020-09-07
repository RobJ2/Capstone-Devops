FROM nginx:alpine
# hadolint ignore=DL4000
LABEL maintainer="Rob Jacobs <jacobs.rob60@hotmail.com>"
MAINTAINER = "jacobs.rob60@hotmail.com"

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
# EXPOSE 800000
CMD ["nginx", "-g" , "daemon off;"]
