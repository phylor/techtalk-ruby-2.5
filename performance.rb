require 'benchmark/ips'

Benchmark.ips do |x|
  x.report "Large string interpolation" do |t|
    a = "Hellooooooooooooooooooooooooooooooooooooooooooooooooooo"
    b = "Wooooooooooooooooooooooooooooooooooooooooooooooooooorld"

    t.times { "#{a}, #{b}!" }
  end

  x.report "Small string interpolation" do |t|
    a = "Hello"
    b = "World"

    t.times { "#{a}, #{b}!" }
  end

  x.report "String prepend" do |t|
    a = "World"

    t.times { a.prepend("Hello") }
  end

  # also for min_by and max_by
  x.report "Enumerable sort_by" do |t|
    a = ['turtle', 'cat', 'fish', 'flamingo']

    t.times { a.sort_by(&:length) }
  end

  x.report "Range min" do |t|
    range = (1..999999)

    t.times { range.min }
  end

  x.report "String scan - String pattern" do |t|
    a = "caterpillar"

    t.times { a.scan("cat") }
  end

  x.report "String scan - Regex pattern" do |t|
    a = "caterpillar"

    t.times { a.scan(/pill/) }
  end
end
