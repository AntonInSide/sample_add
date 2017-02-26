class User < ActiveRecord::Base
	has_secure_password						  					# Прохождение тестов для пароля
	before_save {email.downcase!}								# Переводим email перед сохранением в нижний регистр

	validates :name, presence: true, length: {maximum: 50} 		#Ограничение на длину имени пользователя
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 	# Создаем константу в виде регулярного выражения
	validates :email, presence: true,
						format: {with: VALID_EMAIL_REGEX}, 		# Проверка формата почты, доступность адрессов
						uniqueness: {case_sensitive: false}		# Уникальность адрессов
	validates :password, length: {minimum: 6} 					# Ограничение на минимальную длину пароля
end
