require_relative 'spec_helper'
require_relative '../methods'

describe '#greet_programmer' do

  it 'outputs the string "Hello, programmer!"' do
    expect { greet_programmer }.to output(a_string_including("Hello, programmer!")).to_stdout
  end
  
end

describe '#greet' do

  it 'outputs a string "Hello, Naureen!" when called with "Naureen"' do
    expect { greet("Naureen") }.to output(a_string_including("Hello, Naureen!")).to_stdout
  end

  it 'outputs a string "Hello, Jimmy!" when called with "Jimmy"' do
    expect { greet("Jimmy") }.to output(a_string_including("Hello, Jimmy!")).to_stdout
  end

end

describe '#greet_with_default' do

  it 'outputs a string "Hello, Naureen!" when called with "Naureen"' do
    expect { greet_with_default("Naureen") }.to output(a_string_including("Hello, Naureen!")).to_stdout
  end

  it 'outputs a string "Hello, programmer!" when called with no arguments' do
    expect { greet_with_default }.to output(a_string_including("Hello, programmer!")).to_stdout
  end

end

describe '#add' do

  it 'returns the sum of two numbers' do
    expect(add(2, 5)).to be(7)
  end

end

describe '#halve' do
  
  it 'returns half of the given integer' do
    expect(halve(6)).to be(3)
  end

  it 'returns nil if not given a integer' do
    expect(halve("six")).to be(nil)
  end

end
