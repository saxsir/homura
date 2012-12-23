module Homura
  class Unmo
    def initialize(name)
      @name = name
      # @responder = Homura::Responder.new('What')
      @responder = Homura::RandomResponder.new('Random')
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

