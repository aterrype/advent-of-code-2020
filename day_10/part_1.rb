adapters = []

File.foreach("input.txt", "\n") do |line|
  adapters << line.to_i
end

adapters.sort!

diffOfOne = 0
diffOfThree = 0

adapters.each_with_index do |adapter, idx|
  if idx == 0
    diff = adapter
  else
    diff = adapter - adapters[idx-1]
  end

  diffOfOne += 1 if diff == 1
  diffOfThree += 1 if diff == 3
end

diffOfThree += 1 # Account for the final adapter

puts diffOfOne * diffOfThree