# Here is how to queue tasks from Ruby.

require 'iron_worker_ng'
client = IronWorkerNG::Client.new()
10.times do |i|
  client.tasks.create(
      'hello', {foo: "bar", i: i}
  )
end
