def get_secret_word
	# возвращает массив букв из того слова
	# которое пользователь загадывал в консоли
	secret_word = ARGV[0]

	if (secret_word == nil || secret_word == "")
		abort "Вы не ввели слово для игры"
	end

	return secret_word.downcase.split("")
end

def get_user_input
	letter = ""

	while letter == "" do
		letter = STDIN.gets.encode("UTF-8").chomp
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

def get_word_for_print(secret_word, good_letters)
	result = ""

	for letter in secret_word do
		if good_letters.include? letter
			result += letter + " "
		else
			result += "__ "
		end
	end

	return result
end

def print_status(secret_word, good_letters, bad_letters, errors)
	#1. выводить загаданное слово (как в поле чудес)
	#2. информация об ошибках и уже названные буквы
	#3 ошибок > 7 сообщить о поражении
	#4. слово угадано - сообщить о победе
	puts "\nСлово: " + get_word_for_print(secret_word, good_letters)

	puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

	if errors == 7
		puts "Вы проиграли :("
	else
		if secret_word.uniq.size == good_letters.size
			puts "\n\nПоздравляем! Вы выиграли!\n\n"
		else
			puts "У вас осталось попыток: " + (7-errors).to_s
		end
	end
end

def clear_screen
	system "clear"
end