input = []

File.foreach("input.txt", "\n") do |line|
  input << line.to_i # Put the input in an easier-to-digest format
end

input.sort!()
length = input.length()

input.each_with_index do |i, index|
  for j in input[index+1,length]
    if i + j == 2020
      puts i * j
      return
    elsif i + j > 2020
      break
    end
  end
end
