groups = []
currentGroup = []

File.foreach("input.txt", "\n") do |line|
  if line.strip == ""
    groups << currentGroup
    currentGroup = []
  else
    line.strip.split("").each do |answer|
      currentGroup << answer if !currentGroup.include?(answer)
    end
  end
end

groups << currentGroup if currentGroup != [] # The last line might not be blank

sum = 0

groups.each do |group|
  sum += group.length()
end

puts sum