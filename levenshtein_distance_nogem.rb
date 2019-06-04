def levenshtein_distance(a,b)

	# 2つとも長さゼロの場合は差異ゼロ
	return 0 if a.length == 0 && b.length == 0

	# 片方が長さゼロの場合はもう一方の長さを返却
	return b.length if a.length == 0
	return a.length if b.length == 0

	matrix = Array.new
	0.upto(a.length) { matrix << Array.new }
	0.upto(a.length){ |i| matrix[i][0] = i}
	0.upto(b.length){ |j| matrix[0][j] = j}

	# 1.upto(a.length) do |i|
	# 	1.upto(b.length) do |j|
	# 		m = matrix[i-1][j] + 1
	# 		n = matrix[i][j-1] + 1
	# 		if a[i-1] == b[j-1]
	# 			l = matrix[i-1][j-1]
	# 			matrix[i][j] = l
	# 		else
	# 			matrix[i][j] = [m,n].min
	# 		end
	# 	end
	# end

	# 各文字を比較して、編集距離を各セルに設定する
	1.upto(a.length) do |i|
 		1.upto(b.length) do |j|
    		# 置換の加算値を1とする場合(編集の定義=追加/削除/置換)
    		x = (a[i-1] == b[j-1]) ? 0 : 1
    		m = matrix[i-1][j] + 1
    		n = matrix[i][j-1] + 1
    		l = matrix[i-1][j-1] + x
    		matrix[i][j] = [m, n, l].min
  		end
	end

	return matrix[a.length][b.length]

end

str1 = gets.to_s
str2 = gets.to_s

puts levenshtein_distance(str1,str2)

