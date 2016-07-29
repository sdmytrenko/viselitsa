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


def check_result

end


def print_status



end