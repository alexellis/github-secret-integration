FROM ruby:alpine

ADD https://github.com/alexellis/faas/releases/download/0.5.1-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/
RUN gem install rack
COPY handler.rb .

EXPOSE 8080

ENV fprocess="ruby handler.rb"
ENV marshall_request="true"

CMD ["fwatchdog"]
