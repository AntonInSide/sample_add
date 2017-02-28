class User < ActiveRecord::Base
	has_secure_password						  					# Прохождение тестов для пароля
	before_save {self.email = email.downcase}								# Переводим email перед сохранением в нижний регистр
	before_create :create_remember_token								
	validates :name, presence: true, length: {maximum: 50} 				#Ограничение на длину имени пользователя
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 	# Создаем константу в виде регулярного выражения
	validates :email, presence: true,
						format: {with: VALID_EMAIL_REGEX}, 		# Проверка формата почты, доступность адрессов
						uniqueness: {case_sensitive: false}		# Уникальность адрессов
	validates :password, length: {minimum: 6} 					# Ограничение на минимальную длину пароля

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
