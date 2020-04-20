require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require 'pry'
handle = File.open(ARGV[0], "r")

incoming_text = handle.read.strip
encryption_hash = eval(incoming_text)
encrypted_message = encryption_hash[:encryption]
encrypted_date = encryption_hash[:date]
encrypted_key = encryption_hash[:key]
handle.close

new_enigma = Enigma.new
writer = File.open(ARGV[1], "w")

writer.write(new_enigma.decrypt(encrypted_message, encrypted_key, encrypted_date))

writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_key} and the date #{encrypted_date}"
