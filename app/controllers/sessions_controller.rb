class SessionsController < ApplicationController
  def new

  	email = params[:email].downcase
  	password = params[:password]

  	user = User.find_by_email email

	  respond_to do |format|
	  	if user && user.password == password
	  		Session.create(user_id: user.id ) 
		  	format.html { redirect_to login_path, notice: "Login form not setup! But user was found!" }
		  else
		  	format.html { redirect_to login_path, notice: "No user found." }
		  end
	  end
  		

  	# check name and password in database
  	# if authenticated redirect to dashboard or admin page
  	# else respond with error
  end

  def create
  	# not sure
  end

  def destroy
  	# log out/remove sessions entry from database
  	
  	
  end
end
