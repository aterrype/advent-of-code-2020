rules = []

File.foreach("input.txt", "\n") do |line|
  rules << line.strip
end

colorTree = {}

rules.each do |rule|
  containingColor = rule.split("contain")[0][0..-7]
  containedColors = rule.split("contain")[1][1..-2].split(",")
  next if containedColors[0] == "no other bags"
  containedColors.map! { |color| color[0..-5].strip()[2..]}
  containedColors.each do |color|
    if colorTree[color]
      colorTree[color] << containingColor if !colorTree[color].include?(containingColor)
    else
      colorTree[color] = [containingColor]
    end
  end
end

colorsToCheck = ["shiny gold"]
allContainingColors = []

while colorsToCheck.length() > 0 do
  foundColors = []
  colorsToCheck.each do |color|
    foundColors += colorTree[color] if colorTree[color]
  end
  foundColors.uniq!
  allContainingColors += foundColors
  allContainingColors.uniq!
  colorsToCheck = foundColors
end

puts allContainingColors.length()