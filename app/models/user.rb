class User < ActiveRecord::Base

	has_many :tasks

	validates :email, { uniqueness: true, presence: true }
	validates :password, { presence: true }

	before_save :downcase_email
	before_save :encrypt_password

	before_create :set_login_count

	
	def downcase_email
		self.email = self.email.downcase
	end

	def encrypt_password
		# check if valid hash already, if so, just keep same
		# rescue when BCrypt::Password.new fails
		begin
			BCrypt::Password.new(self.password)
			self.password = self.password
		rescue
			self.password = BCrypt::Password.create(self.password)
		end
	end

	def set_login_count
		self.login_count = 0
	end
	
	# before_save :check_email
	# def check_email
	# 	if !self.email.match(/@/)
	# 		@errors.push 'Email is seemingly incorrect.'
	# 		return false
	# 	end
	# end

end
