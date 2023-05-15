# Your code here!
def greet_programmer
    puts "Hello, programmer!"
end

def greet(name)
    puts "Hello, #{name}"
end
greet(Emmanuel)

def greet_with_default(name = "programmer")
    puts "Hello, #{name}!"
end

def add(num1, num2)
    return num1 + num2
end
add(2,3)

def halve(one)
    if one.class != integer
    return nil
    end

    one/2
end
halve(4)