def get_secret_word
	# возвращает массив букв из того слова
	# которое пользователь загадывал в консоли
	secret_word = ARGV[0]

	if (secret_word == nil || secret_word == "")
		abort "Вы не ввели слово для игры"
	end

	return secret_word.split("")
end

def get_user_input
	letter = ""

	while letter == "" do
		letter = STDIN.gets.encode("UTF-8").downcase.chomp
	end

	return letter
end


def check_result(user_input, secret_word, good_letters, bad_letters)
	if (good_letters.include?(user_input) ||
		bad_letters.include?(user_input))
		#Если эта буква есть в good_letters или bad_letters,
		# то она дальше не пойдет по циклу

		puts "Вы уже называли эту букву"
		return 0
	end

	if secret_word.include? user_input
		good_letters << user_input
		#Только если буква входит в массив, мы наполняем good_letters

		if secret_word.uniq.size == good_letters.size
			#Условие когда отгадано все слово	
			#uniq - извлечение только уникальных букв
			# Если длинна уникальных букв == к-ву хороших букв
			
			return 1
		else
			return 0
		end
	else
		bad_letters << user_input
		return -1
	end
end

def print_status



end