hello_worker
============

A simple hello world IronWorker that shows how to deal with Ruby dependencies (gems) and run your first worker!

## Setup your Iron account (if you don't have one yet)

First off, you need an [Iron.io](http://www.iron.io) account, if you don't have one go sign up for a free account.

Second, you need to have your [iron.json file setup](http://dev.iron.io/worker/reference/configuration/) and the
[iron CLI tool](https://github.com/iron-io/ironcli) installed.

Now you can get cracking!

## Usage

This worker just says hello, so the optional payload for is just a name, see `payload.json`.

You can just use this worker directly by queuing up a job for treeder/hello_worker.

## Build and test the worker

First, vendor the dependencies:

```sh
docker run --rm -v $PWD:/app -w /app treeder/bundle
```

Now build the image:

```sh
docker build -t treeder/hello_worker:latest .
```

And test it:

```sh
docker run --rm -e "PAYLOAD_FILE=/iron/payload.json" -v $PWD:/iron treeder/hello_worker
```

Sweet, it works!  We mount /iron directory so the payload is available and we don't set the working directory on docker run
since the working directory is built into the image.

Now we just push it to Docker Hub:

```sh
docker push treeder/hello_worker
```

And starting queuing up jobs for it to run on IronWorker!

## Queuing up tasks for this image on IronWorker

You can queue up tasks for it in any language. Check out our [Client Libraries](http://dev.iron.io/worker/)
in the language of your choice to make it easy, but here's an example using the cli:

```
iron worker queue --payload '{"name": "Travis"}' --wait treeder/hello_worker
```

or with curl:

```
$ curl -d '{"tasks": [{"code_name": "treeder/hello_worker", "payload": "{\"name\": \"Travis\"}"}]}' --header "Authorization: OAuth YOUR_IRON_TOKEN" --header "Content-Type: application/json" https://worker-aws-us-east-1.iron.io/2/projects/YOUR_PROJECT_ID/tasks
```

Or in your language of choice. Here's a Ruby example: (see `enqueue.rb` to run a bunch):

```ruby
require 'iron_worker'
client = IronWorker::Client.new()
client.tasks.create('treeder/hello_worker', {name: "Travis"})
```

For clients in other languages, see the [Iron.io Dev Center](http://dev.iron.io).
