$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'homura'

def prompt(unmo)
  return "#{unmo.name}:#{unmo.responder_name}> "
end   

puts 'Unmo System prototype : proto'
proto = Homura::Unmo.new('proto')
loop do
  print '> '
  input = gets.chomp!
  break if input == ''
  
  response = proto.dialogue(input)
  puts prompt(proto) + response
end

