require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read.strip

handle.close

new_enigma = Enigma.new
writer = File.open(ARGV[1], "w")

writer.write(new_enigma.encrypt(incoming_text))
writer.close
puts "Created '#{ARGV[1]}' with the key #{new_enigma.key} and the date #{new_enigma.date}"
