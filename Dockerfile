FROM centos:7
MAINTAINER Vekov Ivan <i.vekov@v-halla.ru>
RUN yum install -y epel-release && yum install -y nginx
RUN yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN find /etc/nginx/ -type f -exec sed -i 's/80/8000/g' {} +
RUN mkdir "/usr/share/nginx/html/health/"
RUN echo "{'status':'OK'}" > /usr/share/nginx/html/health/index.html
RUN mkdir "/usr/share/nginx/html/version/"
RUN echo "{'version':'0.1'}" > /usr/share/nginx/html/version/index.html
EXPOSE 8000
CMD [ "nginx" ]