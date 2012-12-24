# -*- coding: utf-8 -*-
module Munou
  class Responder
    def initialize(name)
      @name = name
    end
    
    def response(input)
      return ''
    end
    
    def name
      return @name
    end
  end

  class WhatResponder < Responder
    def response(input)
      return "#{input}ってなに？"
    end
  end
  
  class RandomResponder < Responder
    def initialize(name)
      super
      @phrases = []
      File::open('lib/dics/random.txt') {|f|
        f.each do |line|
          line.chomp!
          next if line.empty? #空行を読み飛ばす
          @phrases.push(line)
        end
      }
      
      def response(input)
        return select_random(@phrases)
      end
      
      def select_random(ary)
        return ary[rand(ary.size)]
      end
    end
  end
end
  
