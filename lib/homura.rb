module Munou
  class Homura
    attr_reader :name

    def initialize(name)
      @name = name
      @dictionary = Munou::Dictionary.new
      
      @resp_what = Munou::WhatResponder.new('What', @dictionary)
      @resp_random = Munou::RandomResponder.new('Random', @dictionary)
      @resp_pattern = Munou::PatternResponder.new('Pattern', @dictionary)
      @responder = @resp_pattern
    end
    
    def dialogue(input)
      case rand(100)
      when 0..59
        @responder = @resp_pattern
      when 60..89
        @responder = @resp_random
      else
        @responder = @resp_what        
      end
      return @responder.response(input)
    end
    
    def responder_name
      return @responder.name
    end
  end
end

