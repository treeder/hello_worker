hello_worker
============

The simplest IronWorker.

## Quick Start

First off, you need an [Iron.io](http://www.iron.io) account, if you don't have one go sign up for a free account.

Second, you need to have your [iron.json file setup](http://dev.iron.io/worker/reference/configuration/).

Now you can get cracking!

### 1. Add this worker to your account

From the command line:

```
$ iron_worker upload https://github.com/treeder/hello_worker/blob/master/hello.worker
```

### 2. Start using it!

You can queue up tasks for it in any language. Check out our [Client Libraries](http://dev.iron.io/)
in the language of your choice to make it easy, but here's an example using curl:

```
curl -d '{"tasks": [{"code_name": "hello", "payload": "{\"foo\": \"bar\"}"}]}' --header "Authorization: OAuth YOUR_TOKEN" --header "Content-Type: application/json" https://worker-aws-us-east-1.iron.io/2/projects/YOUR_PROJECT_ID/tasks
```

Now go look at [HUD](http://hud.iron.io) to see the task and the log.

And here's the same thing using Ruby:

```ruby
require 'iron_worker_ng'
client = IronWorkerNG::Client.new()
client.tasks.create(
    'hello', {ruby_foo: "bar"}
)
```

Now go look at [HUD](http://hud.iron.io) to see the task and the log.
