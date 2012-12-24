module Munou
  class Dictionary
    attr_reader :random, :pattern

    def initialize  
      @random = []
      File::open('lib/dics/random.txt'){|f|
        f.each do |line|
          line.chomp!
          next if line.empty?
          @random.push(line)
        end
      }
      
      @pattern = []
      File::open('lib/dics/pattern.txt'){|f|
        f.each do |line|
          pattern, phrases = line.chomp!.split("\t")
          next if pattern.nil? or phrases.nil?
          @pattern.push(Munou::PatternItem.new(pattern, phrases))
        end
      }
    end
  end
end
