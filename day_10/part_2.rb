def countArrangements(adapters)
  if adapters.length == 1
    return 1
  else
    count = 0
    adapters[1..3].each_with_index do |adapter, idx|
      if adapter != nil && adapter - adapters[0] <= 3
        count += countArrangements(adapters[idx+1..])
      end
    end
    return count
  end
end

adapters = [0]

File.foreach("input.txt", "\n") do |line|
  adapters << line.to_i
end

adapters.sort!

# Break the adapter array up so this isn't hopelessly inefficient
adapterGroups = []
startIndex = 0
adapters.each_with_index do |adapter, idx|
  if !adapters[idx+1] || adapters[idx+1] - adapter == 3
    adapterGroups << adapters[startIndex..idx]
    startIndex = idx+1
  end
end

total = 1
adapterGroups.each do |group|
  total *= countArrangements(group)
end

puts total