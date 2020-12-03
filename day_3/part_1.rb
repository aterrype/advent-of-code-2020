input = []

File.foreach("input.txt", "\n") do |line|
  input << line.strip.split("")
end

patternLength = input[0].length()

lengthIndex = 0
heightIndex = 0
trees = 0

while heightIndex < input.length() do
  trees += 1 if input[heightIndex][lengthIndex] == "#"
  heightIndex += 1
  lengthIndex = (lengthIndex + 3) % patternLength
end

puts trees