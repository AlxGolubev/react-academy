require 'rack'
require 'pry'

require './calculator'

class App
  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    puts params

    case req.path
    when '/'
      [200, {'Content-Type' => 'text/html'}, File.readlines('./index.html')]
    when '/calculator'
      result = calculator_controller(params)
      [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>", "<a href='/'>Home</a>"]]
    else
      [404, {'Content-Type' => 'text/html'}, ["404"]]
    end
  end

  def calculator_controller(params)
    calculator = Calculator.new(params['left'].to_i, params['right'].to_i)

    case params['operation']
    when 'sum'
      calculator.sum
    when 'minus'
      calculator.minus
    when 'divide'
      calculator.divide
    when 'multuply'
      calculator.multuply
    when 'power'
      calculator.power
    end

    "Result: #{calculator.last_result}"
  end
end
