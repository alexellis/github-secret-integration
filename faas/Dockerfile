FROM ruby:alpine

ADD https://github.com/alexellis/faas/releases/download/v0.5-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/
RUN gem install rack
COPY handler.rb .

EXPOSE 8080

CMD ["ruby", "handler.rb"]
