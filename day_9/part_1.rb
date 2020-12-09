numbers = []

File.foreach("input.txt", "\n") do |line|
  numbers << line.to_i
end

numbers[25..].each_with_index do |number, idx|
  doesSumExist = false
  preamble = numbers[idx..(idx+24)].sort!
  preamble.each_with_index do |i, preambleIdx|
    for j in preamble[(preambleIdx+1)..25]
      if i + j == number
        doesSumExist = true
        break
      elsif i + j > number
        break
      end
    end
  end
  if !doesSumExist
    puts number
    break
  end
end