require "./methods.rb"

puts "Игра Виселица. ver.1.0"

secret_word = get_secret_word
# метод обрабатывает слово, которое загадано в командной строке

errors = 0
bad_letters = []
good_letters = []

while errors < 7 do
	print_status(secret_word, good_letters, bad_letters, errors)
	# метод показывает текущий статус игры

	puts "Введите след. букву"

	user_input = get_user_input

	result = check_result(user_input, secret_word, good_letters, bad_letters)

	if (result == -1)
		errors += 1
	else (result == 1)
		break
	end
end

print_status(secret_word, good_letters, bad_letters, errors)