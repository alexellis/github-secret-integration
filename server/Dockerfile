FROM ruby:alpine
WORKDIR /root/
RUN gem install sinatra rack
COPY handler.rb .
CMD ["ruby", "handler.rb"]
