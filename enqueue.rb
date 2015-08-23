# Here is how to queue tasks from Ruby.

require 'iron_worker'
client = IronWorkerNG::Client.new()
10.times do |i|
  client.tasks.create(
      'hello', {name: "World #{i}", i: i}
  )
end
