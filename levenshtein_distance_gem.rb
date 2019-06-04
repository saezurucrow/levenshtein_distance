require "damerau-levenshtein"

str1 = gets.to_s
str2 = gets.to_s

p DamerauLevenshtein.distance(str1,str2)

