seats = []

File.foreach("input.txt", "\n") do |line|
  seats << line.strip.split("")
end

seatsChanged = true
while seatsChanged do
  newSeats = seats.clone.map(&:clone)
  seats.each_with_index do |row, rowIdx|
    row.each_with_index do |seat, colIdx|
      adjacentSeats = []
      for i in (rowIdx - 1..rowIdx+1) do
        for j in (colIdx - 1..colIdx+1) do
          adjacentSeats << seats[i][j] if (i >= 0 && j >= 0 && seats[i] && seats[i][j] && !(i == rowIdx && j == colIdx))
        end
      end
      if seat == "L"
        newSeats[rowIdx][colIdx] = "#" if adjacentSeats.count("#") == 0
      elsif seat == "#"
        newSeats[rowIdx][colIdx] = "L" if adjacentSeats.count("#") >= 4
      end
    end
  end
  if seats == newSeats
    seatsChanged = false
  else
    seats = newSeats
  end
end

totalOccupied = 0
seats.each do |row|
  totalOccupied += row.count("#")
end

puts totalOccupied