class User < ActiveRecord::Base
	# before_save :check_email
	# def check_email
	# 	if !self.email.match(/@/)
	# 		@errors.push 'Email is seemingly incorrect.'
	# 		return false
	# 	end
	# end

end