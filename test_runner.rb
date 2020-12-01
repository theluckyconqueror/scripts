#!/usr/bin/env ruby
require 'digest'

test_file = ARGV[0]
ruby_file = ARGV[1]
command = "ruby --verbose #{test_file}"

if File.exist?(ruby_file)
  old_hash = Digest::MD5.hexdigest(File.read(ruby_file))
  while true
    sleep(2)
    new_hash = Digest::MD5.hexdigest(File.read(ruby_file))
    if old_hash != new_hash
      system("clear")
      system(command)
      old_hash = new_hash
    else
    end
  end
else
  raise "File does not exist."
end
