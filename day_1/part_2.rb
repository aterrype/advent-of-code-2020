input = []

File.foreach("input.txt", "\n") do |line|
  input << line.to_i # Put the input in an easier-to-digest format
end

input.sort!()
length = input.length()

input.each_with_index do |i, idx1|
  input[idx1+1,length].each_with_index do |j, idx2|
    if i + j > 2020
      break
    else
      for k in input [idx2+1, length]
        if i + j + k == 2020
          puts i*j*k
          return
        elsif i + j + k > 2020
          break
        end
      end
    end
  end
end