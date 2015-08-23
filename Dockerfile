FROM iron/ruby

WORKDIR /worker
ADD . /worker

ENTRYPOINT ["ruby", "hello.rb"]
