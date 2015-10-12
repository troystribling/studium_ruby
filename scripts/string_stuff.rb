def word_break_naive(in_str, dict)
	words = []
	if word_break_naive_words(in_str, dict, words, 0)
		words
	else
		"Cannoy Break Word"
	end
end

def word_break_naive_words(in_str, dict, words, start)
	return false if in_str.nil?
	dict.each do |word|
		in_str.length.times do |i|
			if word == in_str[start..i]
				words << word
				word_break_naive_words(in_str[i+1..-1], dict, words, i+1)
			else
				break if
			end
		end
	end
	false
end