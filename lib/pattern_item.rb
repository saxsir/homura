module Munou
  class PatternItem
    attr_reader :modify, :pattern, :phrases

    SEPARATOR = /^((-?\d+)##)?(.*)$/
    
    def initialize(pattern, phrases)
      SEPARATOR =~ pattern
      @modify, @pattern = $2.to_i, $3
          
      @phrases = []
      phrases.split('|').each do |phrase|
        SEPARATOR =~ phrase
        @phrases.push({'need'=>$2.to_i, 'phrase'=>$3})
      end
    end
    
    def match(str)
      return str.match(@pattern)
    end
    
    def choice(mood)
      choices = []
      @phrases.each do |p|
        choices.push(p['phrase']) if suitable?(p['need'], mood)
      end
      return (choices.empty?)? nil : select_random(choices)
    end

    def suitable?(need, mood)
      return true if need  == 0
      if need > 0
        return mood > need
      else
        return mood < need
      end
    end

    def select_random(ary)
      return ary[rand(ary.size)]
    end
  end
end
