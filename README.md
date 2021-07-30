# Methods

## Learning Goals

- Understand the similarities between methods in Ruby and functions in JavaScript
- Identify key differences between methods and functions
- Define methods with parameters
- Call methods and use their return value

## Introduction

One of the first things you likely learned in JavaScript was how to write
functions. In this lesson, you'll get practice writing methods in Ruby to see
the difference between Ruby methods and JavaScript functions.

## Ruby Method Syntax

To start, let's try re-writing this JavaScript function in Ruby:

```js
function myFunction(param) {
  console.log("Running myFunction");
  return param + 1;
}
```

As a quick recap of the syntax here:

- The **`function` keyword** identifies this code as a function.
- `myFunction` is a **variable name** we can use to refer to the function from
  elsewhere in our code, written in camel case by convention.
- The parentheses `()` after the function name give a space where we can define
  **parameters** for our function.
- `param` is the variable name given to our function's parameter; it will be
  assigned a value when the function is invoked and passed an argument.
- To define the body of the function, we use curly brackets (`{ }`).
- `console.log` is a method that will output information to the terminal;
  remember, this is _different_ from a function's **return value**.
- The `return` keyword is needed when we want our function to return a value
  when it is called; in this case, it will return a value of whatever the
  `param` variable is plus one.

To actually run the code inside the function, we must invoke it:

```js
const myFunctionReturnValue = myFunction(1);
// => "Running myFunction"
console.log(myFunctionReturnValue);
// => 2
```

Here, we're calling the function `myFunction` with an **argument** of `1`. We
are then assigning the **return value** of `myFunction` to a new variable,
`myFunctionReturnValue`.

If we wanted to write a method in Ruby with similar functionality, here's how it
would look:

```rb
def my_method(param)
  puts "Running my_method"
  param + 1
end
```

There are a few key differences in the syntax here:

- Use the `def` keyword to identify this code as a method.
- Write the name of the method in snake case (by convention).
- Parameters are still defined in parentheses, after the method name.
- Instead of curly parentheses, use the `end` keyword to identify where the
  method ends.
- In Ruby, whatever the **last line of a method is will be its return value**.
  You can use the `return` keyword to explicitly identify the return value of a
  method, but Rubyists tend to rely on the implicit return instead.

Run IRB, and copy/paste the method definition above into your IRB session. Then,
run the method:

```rb
my_method_return_value = my_method(1)
# Running my_method
# => 2
my_method_return_value
# => 2
```

When the `#my_method` method is called, you'll see the output from the `#puts`
method in the terminal, followed by the return value. The return value, `2`,
is then saved to the variable `my_method_return_value`.

> Why are they called methods in Ruby as opposed to functions? If you recall
> from Object Oriented JavaScript, the difference between a method and a
> function is that a **method** is a special sub-category of functions that must
> be called on some object. In Ruby, every method we define — even when
> it's not defined explicitly "on an object" or as part of a class definition
> — is still actually defined on a built-in Ruby object: the global `main`
> object, which you'll see referenced in error messages like "NameError
> (undefined local variable or method 'my_var' for main:Object)". `main` is
> roughly equivalent to the global object in JavaScript (the window in the
> browser); you can see for yourself by entering IRB and typing `self`. Read
> more about [Ruby's Main Object here][ruby main] if you're curious!

[ruby main]: https://codequizzes.wordpress.com/2014/04/23/rubys-main-object-top-level-context/

### Optional Parentheses

Just like in JavaScript, you can invoke a method by placing parentheses at the
end and passing in values as arguments, as in the example above. In Ruby though,
parentheses are optional:

```rb
my_method 1
# Running my_method
# => 2
```

This syntax is a point of confusion for developers new to Ruby, since it can
make it a bit less clear when using code whether you're invoking a **method** or
using a **variable**. Consider the following method:

```rb
def say_hello()
  "hello!"
end
```

Parentheses are optional when defining the method, so we could also write this
method like so:

```rb
def say_hello
  "hello!"
end
```

[The convention in Ruby][method parens] is to use parentheses as part of a
method definition when it takes parameters, and to omit them when it has no
parameters.

[method parens]: https://rubystyle.guide/#method-parens

You could **run** this method by placing parentheses at the end, like you would
in JavaScript:

```rb
say_hello()
# => "hello"
```

But you can also run this method without parentheses:

```rb
say_hello
# => "hello"
```

In certain contexts, removing parentheses from the method calls can make your
code more pleasant to look at. You might also see some Domain Specific Languages
(DSLs) that prefer to omit parentheses. You've probably already seen a little
bit of RSpec's DSL in the test files, for example:

```rb
describe "MyRubyThing" do
  it "runs" do
    # test here
  end
end
```

`#describe` and `#it` are just methods, so the above could have been written:

```rb
describe("MyRubyThing") do
  it("runs") do
    # test here
  end
end
```

But I think you'll agree that it looks nicer (and is easier to read) without the
parentheses.

As you're getting started, just keep the fact that **parentheses are optional**
in the back of your mind, and remember to ask yourself the question when looking
at code: "Is this a variable, or is this a method?"

## Method Arguments

JavaScript allows you to define functions that expect a certain number of
arguments, but will still run your code even if you don't pass in the expected
number when you invoke the function. This can lead to some unexpected behavior
in your JavaScript applications.

Consider the following:

```js
function sayHi(name) {
  console.log(`Hi there, ${name}!`);
}

sayHi();
```

What do you think will happen when this code runs? Will it throw an error? Print
something to the console? If so, what? Try running it in the browser to find out.

Unfortunately for JavaScript developers, bugs like these are hard to identify
because they can only be found by testing our code and looking for unexpected
behavior.

In Ruby, thankfully, when we run a method without passing in the required
arguments it will give us an error message:

```rb
def say_hi(name)
  puts "Hi there, #{name}!"
end

say_hi
# => ArgumentError (wrong number of arguments (given 0, expected 1))
```

Error messages like this are a **good thing** for us as developers, because it
ensures that we are using methods as they are intending to be used, rather than
trying to "fail gracefully" like JavaScript does.

## Default Arguments

We can fix the behavior of our JavaScript function above by providing a default
argument: a value that will be used if we don't explicitly provide one.

```js
function sayHi(name = "friend") {
  console.log(`Hi there, ${name}!`);
}

sayHi();
// => "Hi there, friend!"
sayHi("Sunny");
// => "Hi there, Sunny!"
```

Ruby also lets us provide default arguments:

```rb
def say_hi(name = "Rubyist")
  puts "Hi there, #{name}!"
end

say_hi
# => "Hi there, Rubyist!"

say_hi "Sunny"
# => "Hi there, Sunny!"
```

## Return Values

You can categorize all functions that you write as generally useful for one (or
both) of these things:

- What _return value_ they have
- What _side effects_ they have (what other parts of the application they
  change; or what they output to the terminal; or what they write to a file;
  etc)

Writing output to the terminal using `console.log` or `#puts` is a _side effect_
of a function: it's distinct from the function's _return value_.

Consider these two JavaScript functions:

```js
function addAndLog(num1, num2) {
  console.log(num1 + num2);
}

function addAndReturn(num1, num2) {
  return num1 + num2;
}

const sum1 = addAndLog(2, 2);
const sum2 = addAndReturn(2, 2);
```

What do you expect the values of `sum1` and `sum2` to be? What output would you
expect to see in the console if you ran this code?

Since `addAndLog` doesn't use the `return` keyword, the value of `sum1` is
undefined. We're only using `addAndLog` for its _side effect_ of logging output
to the terminal. `sum2`, on the other hand, will have a value of `4`, since we
are using `addAndReturn` for its return value.

Think of it this way: methods are like vending machines. When you use a vending
machine you just put in two arguments, the number (C7) and your money. We
already know how to use arguments, but then your vending machine might do two
things. One, it will make a noise saying that everything worked, beep beep. Then
it gives you the soda. The soda is the return type. But those beeps? Are you
able to do anything with them? Nope! That's like `#puts`: it just tells you stuff
and then goes into the ether! Gone forever.

Every method in Ruby returns a value by default. This returned value will be the
value of the last statement:

```rb
def add_and_log(num1, num2)
  puts num1 + num2
end

def add_and_return(num1, num2)
  return num1 + num2
end

sum1 = add_and_log(2, 2)
# => nil
sum2 = add_and_return(2, 2)
# => 4
```

The return value of the `#add_and_log` method is `nil`, because `#puts` returns
`nil`.

Say you're the best painter in the world, Bob Ross. To make a method that just
prints your name and returns `nil`, you could write:

```rb
def print_name
  puts "Bob Ross"
end
```

To write a method that returns your name but doesn't print anything, you could
write:

```rb
def return_name
  "Bob Ross"
end
```

To both print and return your name, you could write:

```rb
def print_and_return_name
  puts "Bob Ross"
  "Bob Ross"
end
```

If you accidentally switched the order of the lines inside the method:

```rb
def broken_print_and_return_name
  "Bob Ross"
  puts "Bob Ross"
end
```

The method would instead print "Bob Ross" and return `nil`. This is because the
last line that was evaluated was `puts ...` and the return value of a `#puts` is
always `nil`.

### The Return Keyword

There is one other way to return a value from a method, and that is to use the
`return` keyword.

Let's take a look:

```rb
def stylish_painter
  best_hairstyle = "Bob Ross"
  return "Jean-Michel Basquiat"
  best_hairstyle
end

stylish_painter
```

What do you expect the return value of the above method to be? Go into IRB, copy
and paste the above method and call it.

You may have expected the return value to be Bob Ross. His name is the last line
of the method. _However_, the return value of the above method is actually
Jean-Michel Basquiat! The `return` keyword will disrupt the execution of your
method, and prevent Ruby from running any lines of code after the `return`
keyword.

The explicit use of the `return` keyword is generally avoided by many Rubyists,
but there are instances where you might want to use `return` instead of relying
on implicit returns; for example, if we wanted to use a [guard clause][] and exit
a function early if a certain condition isn't met:

```rb
def reverse_name(name)
  if name.class != String
    return nil
  end

  name.reverse
end

reverse_name("Bob Ross")
# => "ssoR boB"
reverse_name(123)
# => nil
```

[guard clause]: https://devblast.com/b/what-are-guard-clauses

## Instructions

In the `js/index.js` file, there are four functions defined in JavaScript. Your
job is to recreate the functionality of those functions by writing methods in
Ruby that will accomplish the same thing.

Write your code in `methods.rb`. Run `learn test`, and use the tests along with
the code in `js/index.js` to guide your work.

1. Define a method `#greet_programmer` that takes no arguments. It should output
   the string "Hello, programmer!" to the terminal with `#puts`.

1. Define a method `#greet` that takes one argument, a name. It should output
   the string "Hello, name!" (with "name" being whatever value was passed as an
   argument) to the terminal with `#puts`.

1. Define a method `#greet_with_default` that takes one argument, a name. It
   should output the string "Hello, name!" (with "name" being whatever value was
   passed as an argument) to the terminal with `#puts`. If no arguments are
   passed in, it should output the string "Hello, programmer!".

1. Define a method `#add` that takes two numbers as arguments and **returns** the
   sum of those two numbers.

1. Define a method `#halve` that takes one number as an argument and **returns**
   the that number's value, divided by two. If the argument is **not** an
   integer, it should return `nil` and not throw an error.

## Conclusion

Ruby's method syntax has a few things that make them distinct from JavaScript
functions. In particular, make sure you pay attention to the **implicit return**
value of Ruby methods, and always call methods with the right number of
arguments to avoid errors. You should also keep in mind that **parentheses are
optional when calling methods**.

## Resources

- [Writing Ruby Methods](https://www.rubyguides.com/2019/06/ruby-method-definition/)
