input = []

File.foreach("input.txt", "\n") do |line|
  input << line
end

validPasswords = 0

input.each do |line|
  parts = line.split()
  positions = parts[0].split("-").map { |n| n.to_i }
  letter = parts[1][0]
  validPasswords += 1 if (parts[2][positions[0]-1] == letter) ^ (parts[2][positions[1]-1] == letter)
end

puts validPasswords