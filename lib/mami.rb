module Munou
  class Mami
    def initialize(name)
      @name = name
      @responder = Munou::RandomResponder.new('Random')
    end
    
    def dialogue(input)
      return @responder.response(input)
    end
    
    def responder_name
      return @responder.name
    end

    def name
      return @name
    end
  end
end

