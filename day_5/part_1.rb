boardingPasses = []

File.foreach("input.txt", "\n") do |line|
  boardingPasses << line.strip
end

highestId = 0

boardingPasses.each do |boardingPass|
  rows = (0..127).to_a
  cols = (0..7).to_a
  boardingPass.split("").each do |char|
    if char == "F"
      rows = rows[0..rows.length()/2-1]
    elsif char == "B"
      rows = rows[rows.length()/2..]
    elsif char == "L"
      cols = cols[0..cols.length()/2-1]
    elsif char == "R"
      cols = cols[cols.length()/2..]
    end
  end
  
  id = (rows[0] * 8) + cols[0]
  highestId = id if (id > highestId)
end

puts highestId