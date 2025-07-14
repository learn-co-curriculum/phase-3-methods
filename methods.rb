def greet_programmer
  puts "Hello, programmer!"
end

def greet(name)
  puts "Hello, #{name}!"
end

def greet_with_default(name = "programmer")
  puts "Hello, #{name}!"
end

def add(x, y)
  x + y
end

def halve(int)
  if int.class != Integer
    return nil
  end
  int / 2
end
