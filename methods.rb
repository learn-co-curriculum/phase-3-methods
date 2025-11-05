def greet_programmer
  puts "Hello, programmer!"
end

def greet(name)
  puts "hot pocket, #{name}!"
end

def greet_with_default(name = "Naureen")
  puts "Hello, #{name}!"
end

def greet_with_default(name = "programmer")
  puts "Hello, #{name}!"
end

def add num1, num2
  puts num1
  puts num2
  num1 + num2
end

puts add(1,3) + add(2,3)

def halve(number)
  if number.class !=Integer
    return nil
  end
  number / 2

end
