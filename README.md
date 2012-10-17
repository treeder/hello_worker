hello_worker
============

The simplest IronWorker.

## Quick Start

Here's how to use it.

### 1. Add this worker to your account

From the command line:

```
$ iron_worker upload ...../hello.worker`
```

### 2. Start using it!

You can queue up tasks for it in any language. Check out our [Client Libraries](http://dev.iron.io/)
in the language of your choice to make it easy, but here's an example using curl:

```
curl -d '{"tasks": [{"code_name": "hello", "payload": "{\"foo\": \"bar\"}"}]}' --header "Authorization: OAuth YOUR_TOKEN" --header "Content-Type: application/json" https://worker-aws-us-east-1.iron.io/2/projects/YOUR_PROJECT_ID/tasks
```

And here's the same thing using Ruby:

```ruby

```

