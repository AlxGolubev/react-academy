def sum(left, right)
  left + right
end

def divide(left, right)
  if right.zero?
    raise 'You cannot divide on zero'
  end

  left / right
end

def app
  puts "Running method sum"
  result = sum(gets.to_i, gets.to_i)

  puts result

  puts "Running method divide"
  result = divide(gets.to_i, gets.to_i)
  puts result
end
