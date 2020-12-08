def executeInstructions(instructions)
  accumulator = 0
  currentLine = 0
  executedLines = []

  while !executedLines.include?(currentLine) && currentLine < instructions.length() do
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

  didTerminate = (currentLine >= instructions.length())
  return [didTerminate, accumulator]
  
end

instructions = []

File.foreach("input.txt", "\n") do |line|
  instructions << line.strip
end


instructions.each_with_index do |instruction, index|
  code = instruction[0..2]
  if code == "acc"
    next
  elsif code == "jmp"
    tempInstructions = instructions.clone
    tempInstructions[index] = "nop" + instruction[3..]
  elsif code == "nop"
    tempInstructions = instructions.clone
    tempInstructions[index] = "jmp" + instruction[3..]
  end
  output = executeInstructions(tempInstructions)
  puts output[1] if output[0] == true
end
