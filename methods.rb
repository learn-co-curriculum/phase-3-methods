# Your code here!
def greet_programmer
    puts "Hello, programmer!"
end

def greet(name)
    puts "Hello, #{name}!"
end

def greet_with_default(name = 'programmer')
    puts "Hello, #{name}!"
end

def add (num1, num2)
    num1 + num2
end

def halve (num1)
    return nil unless num1.class == Integer

    num1 / 2
end