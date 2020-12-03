def countTrees(treeGrid, right, down)
  patternLength = treeGrid[0].length()

  lengthIndex = 0
  heightIndex = 0
  trees = 0
  
  while heightIndex < treeGrid.length() do
    trees += 1 if treeGrid[heightIndex][lengthIndex] == "#"
    heightIndex += down
    lengthIndex = (lengthIndex + right) % patternLength
  end

  return trees
end

input = []

File.foreach("input.txt", "\n") do |line|
  input << line.strip.split("")
end

totalTrees = countTrees(input, 1, 1) * countTrees(input, 3, 1) * countTrees(input, 5, 1) * countTrees(input, 7, 1) * countTrees(input, 1, 2)

puts totalTrees