$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'munou'

def prompt(mami)
  return "#{mami.name}:#{mami.responder_name}> "
end   

puts 'Munou System prototype : mami'
mami = Munou::Mami.new('mami')
loop do
  print '> '
  input = gets.chomp!
  break if input == ''
  
  response = mami.dialogue(input)
  puts prompt(mami) + response
end

