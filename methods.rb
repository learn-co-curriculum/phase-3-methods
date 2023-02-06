#greet_programmer
def greet_programmer
   puts "Hello, programmer!"
end    
greet_programmer

#greet
def greet(name = "Naureen")
    puts "Hello, #{name}!"
    # puts "Hello, Jimmy!"
end    
greet "Jimmy"

# greet_with_default
def greet_with_default(user = "programmer")
    puts "Hello, #{user}!"
end
greet_with_default "Naureen"

#add
def add num1, num2
    puts num1
    puts num2
    num1 + num2
end 

# halve
def halve(num)
    return nil unless num.is_a?(Integer)
    puts num 
    num /2
end 
 