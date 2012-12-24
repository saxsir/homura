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
      @response = ['約束するわ！絶対にあなたを救ってみせる！',
                   'もう…誰にも頼らない　誰に…解ってもらう必要もない…',
                   '暁美ほむらです。よろしくお願いします',
                   'それじゃ…それじゃ私は、何のために…'
                  ]
    end
    
    def response(input)
      return @response[rand(@response.size)]
    end
  end
end

