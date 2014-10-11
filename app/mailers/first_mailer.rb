class FirstMailer < ActionMailer::Base
  default from: "info@richardkeller.net", to: "richard.be.jamin@gmail.com"

  def welcome_mail
  	@user = User.find 1
  	mail(to: @user.email, subject: 'Do you have any spam?')
  end

end
