numbers = []

File.foreach("input.txt", "\n") do |line|
  numbers << line.to_i
end

sum = 393911906
sumRange = []

for i in (0..numbers.length)
  for j in (i+1..numbers.length)
    slice = numbers[i..j]
    if slice.inject(:+) == sum
      sumRange = slice
      break
    end
  end
end

sumRange.sort!
puts sumRange[0] + sumRange[-1]