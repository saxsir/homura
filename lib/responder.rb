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
      @response = ['私は巴マミ',
                   'ティロ・フィナーレ！！',
                   'もう何も怖くない。私—、独りぼっちじゃないもの！',
                   'みんな死ぬしかないじゃない！あなたも…私もッ！！'
                  ]
    end
    
    def response(input)
      return @response[rand(@response.size)]
    end
  end
end

