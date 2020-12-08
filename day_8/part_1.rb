instructions = []

File.foreach("input.txt", "\n") do |line|
  instructions << line.strip
end

accumulator = 0
currentLine = 0
executedLines = []

while !executedLines.include?(currentLine) do
  executedLines << currentLine
  instruction = instructions[currentLine]
  code = instruction[0..2]
  if code == "acc"
    accumulator += instruction[4..].to_i
    currentLine += 1
  elsif code == "jmp"
    currentLine += instruction[4..].to_i
  elsif code == "nop"
    currentLine += 1
  end
end

puts accumulator
