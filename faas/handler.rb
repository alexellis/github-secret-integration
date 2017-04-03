require 'json'

def handle
  req = JSON.parse(STDIN.read.strip)
  puts req

end

handle()
