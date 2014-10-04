class User < ActiveRecord::Base

	validates :email, { uniqueness: true, presence: true }
	before_save :downcase_email

	def downcase_email
		self.email = self.email.downcase
	end
	
	# before_save :check_email
	# def check_email
	# 	if !self.email.match(/@/)
	# 		@errors.push 'Email is seemingly incorrect.'
	# 		return false
	# 	end
	# end

end
