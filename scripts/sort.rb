def merge(a1, a2)
	n1, n2 = a1.length, a2.length
	n = n1 + n2
	i, j = 0, 0
	b = []
	n.times do |k|
		if i >= n1
			b[k] = a2[j]
			j += 1
		elsif j >= n2
			b[k] = a1[i]
			i += 1
		elsif a1[i] < a2[j]
			b[k] = a1[i]
			i += 1
		else
			b[k] = a2[j]
			j += 1
		end
	end
	b
end

def has_substring(str, substr)
	m = substr.length
	n = str.lengh - m
	for i in (0..n) do
		for j in (0..m-1) do
			if str[i+j] != substr[j]
				break
			else
				return true if j == m-1
			end
		end
	end
	false
end