def o1_rescue
  [2.0, 3.0, 8.0, 0, 9.0].map do |n|
    1 / n
  rescue
    puts 'ups, something went wrong'
    0
  else
    puts 'overriding the block, haha'
    2 * n
  ensure
    puts 'I always run!'
    3 * n
  end
end

def o2_toplevel_constants
  # ruby issue created by gucki!

  # class World; end
  # class Car; end
  # class World::Car; end # refers to Car in the root namespace!
  # in 2.5 this root namespace lookup no longer works
  # puts World::Cars
end

def o3_bundler
  `gem install bundler`
  puts 'stay tuned for 2.6 :('
end

def o4_backtrace
  1 / 0
end

def o5_yield_self
  puts 2.yield_self { |n| n * 10 }
  puts 2.tap { |n| n * 10 }
end

def o6_strings
  puts 'invisible'.delete_prefix 'in'
  puts 'worked'.delete_suffix 'ed'
end

def o7_arrays
  [3, 4].prepend(1, 2)
  [3, 4].append(1, 2)
end

def o8_hashes
  puts ({ 'a' => 1, 'b' => 2 }.transform_keys do |key|
    key.to_sym
  end)
end

def o9_dir
  puts Dir.entries './'
  puts Dir.children './'
  puts Dir.each_child('./').to_a
end
