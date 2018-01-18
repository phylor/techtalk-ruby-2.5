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
  # new alias for unshift
  [3, 4].prepend(1, 2)

  # new alias for push
  [3, 4].append(1, 2)
end

def o8_hashes
  h = { 'a' => 1, 'b' => 2 }

  puts (h.transform_keys do |key|
    key.to_sym
  end)

  puts h.transform_keys!(&:to_sym)

  puts h.slice(:a)
end

def o9_dir
  # Note that pp is required by default
  pp Dir.entries './'
  pp Dir.children './'
  pp Dir.each_child('./').to_a
end

def o10_enum_pattern
  strs = ['abc', 'def', 'ghi']

  puts strs.any?(/g/)
  puts strs.all?(/g/)
  puts strs.none?(/q/)
  puts strs.all?(String)
end
