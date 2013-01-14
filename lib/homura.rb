# -*- coding: utf-8 -*-
module Munou
  class Homura
    attr_reader :name

    def initialize(name)
      @name = name
      @dictionary = Munou::Dictionary.new
      @emotion = Munou::Emotion.new(@dictionary)
      
      @resp_what = Munou::WhatResponder.new('What', @dictionary)
      @resp_random = Munou::RandomResponder.new('Random', @dictionary)
      @resp_pattern = Munou::PatternResponder.new('Pattern', @dictionary)
      @responder = @resp_pattern
    end
    
    def dialogue(input)
      @emotion.update(input)

      case rand(100)
      when 0..59
        @responder = @resp_pattern
      when 60..100
        @responder = @resp_random
      else
        @responder = @resp_what        
      end
      
      # respを決めた後に学習しないと、覚えたての発言をオウム返しにする可能性があるので...
      resp = @responder.response(input, @emotion.mood)
      @dictionary.study(input)

      return resp
    end

    def save
      @dictionary.save
    end
    
    def responder_name
      return @responder.name
    end

    def mood
      return @emotion.mood
    end
  end
end

