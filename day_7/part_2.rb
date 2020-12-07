rules = []

File.foreach("input.txt", "\n") do |line|
  rules << line.strip
end

colorTree = {}

rules.each do |rule|
  containingColor = rule.split("contain")[0][0..-7]
  containedColors = rule.split("contain")[1][1..-2].split(",")
  colorTree[containingColor] = containedColors
end

colorsToCheck = [["shiny gold", 1]]
totalBags = 0

while colorsToCheck.length() > 0 do
  foundColors = []
  colorsToCheck.each do |color|
    colorName = color[0]
    colorCount = color[1]
    containedColors = colorTree[colorName].clone
    next if containedColors[0] == "no other bags"
    containedColors.map! { |color| color[0..-5].strip}
    containedColors.each do |containedColor|
      bagsForColor = colorCount * containedColor[0].to_i # Taking the easy way out because none of the numbers are greater than 9
      totalBags += bagsForColor
      foundColors << [containedColor[2..], bagsForColor]
    end
  end
  colorsToCheck = foundColors
end

puts totalBags