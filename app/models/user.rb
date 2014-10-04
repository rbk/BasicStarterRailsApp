require 'bcrypt'
class User < ActiveRecord::Base

	validates :email, { uniqueness: true, presence: true }
	validates :password, { presence: true }
	before_save :downcase_email
	before_save :encrypt_password

	def downcase_email
		self.email = self.email.downcase
	end

	def encrypt_password
		self.password = BCrypt::Password.create(self.password)
	end
	
	# before_save :check_email
	# def check_email
	# 	if !self.email.match(/@/)
	# 		@errors.push 'Email is seemingly incorrect.'
	# 		return false
	# 	end
	# end

end
