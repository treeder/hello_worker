require_relative 'bundle/bundler/setup'
require 'iron_worker'

puts "Hello #{IronWorker.payload['name'] || "World"}!"
