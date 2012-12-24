# -*- coding: utf-8 -*-
module Munou
  class Responder
    attr_reader :name
    
    def initialize(name, dictionary)
      @name = name
      @dictionary = dictionary
    end
    
    def response(input, mood)
      return ''
    end
    
    def select_random(ary)
      return ary[rand(ary.size)]
    end
  end
  
  class WhatResponder < Responder
    def response(input, mood)
      return "<what>" + "#{input}ってなに？" + "</what>"
    end
  end
  
  class RandomResponder < Responder
    def response(input, mood)
      return "<random>" + select_random(@dictionary.random) + "</random>"
    end
  end
  
  class PatternResponder < Responder
    def response(input, mood)
      @dictionary.pattern.each do|ptn_item|
        if m = ptn_item.match(input)
          resp = ptn_item.choice(mood)
          next if resp.nil?
          return resp.gsub(/%match%/, m.to_s)
        end
      end
      
      return select_random(@dictionary.random)
    end
  end
end
  
