# Your code here!

def my_method(param)
    puts 'Running my_method'
    param + 1
end

def greet_programmer
    puts "Hello, programmer!"
end

def greet(name)
    puts "Hello, #{name}!"
end

def greet_with_default(name = "programmer")
    puts "Hello, #{name}!"
end

def add(num1, num2)
    num1 + num2
end

def halve(num)
    if num.class != Integer
        return nil
    end

    num / 2
end
