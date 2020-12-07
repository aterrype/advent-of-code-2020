groups = []
currentGroup = []

File.foreach("input.txt", "\n") do |line|
  if line.strip == ""
    groups << currentGroup.inject(:&)
    currentGroup = []
  else
    currentGroup << line.strip.split("")
  end
end

groups << currentGroup.inject(:&) if currentGroup != [] # The last line might not be blank

sum = 0

groups.each do |group|
  sum += group.length()
end

puts sum