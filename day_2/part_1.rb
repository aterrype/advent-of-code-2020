input = []

File.foreach("input.txt", "\n") do |line|
  input << line
end

validPasswords = 0

input.each do |line|
  parts = line.split()
  range = parts[0].split("-").map { |n| n.to_i }
  letter = parts[1][0]
  letterCount = (parts[2].split("").select { |n| n==letter }).length()
  validPasswords += 1 if (range[0] <= letterCount && letterCount <= range[1])
end

puts validPasswords