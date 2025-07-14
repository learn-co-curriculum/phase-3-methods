def greet_programmer
  puts "Hello, programmer!"
end

def greet(user)
  puts "Hello, #{user}!"
end

def greet_with_default(user = "programmer")
  puts "Hello, #{user}!"
end

def add(a,b)
  a + b
end

def halve(int)
  int.class.name == 'Integer' ? int / 2 : nil
end
