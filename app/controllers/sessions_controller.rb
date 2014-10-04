require 'bcrypt'
class SessionsController < ApplicationController
  def new
  	email = params[:email].downcase || ''
  	password = params[:password] || ''
  	user = User.find_by_email email
	  respond_to do |format|
      if !password || !user
        
        # if no input or user, just notify user that they didn't do something right
        
        format.html { redirect_to login_path, notice: "Hopefully you can remember your credentials." }
      
      else 

        # validate password if user is found and password is given

        stored_password = BCrypt::Password.new(user.password)
        password_from_user = BCrypt::Password.create(password)
        
        if stored_password == password
          user_session = Session.find_by_user_id(user.id)
          if user_session
            format.html { redirect_to login_path, notice: "It seems that you have done this before." }          
          else
            Session.create({user_id: user.id, email: user.email, group: user.group }) 
            format.html { redirect_to login_path, notice: "Login Successful! Welcome back!" }
          end

          session[:user_id] = user.id
          session[:group] = user.group
  		  else

          # passwords don't match for this user so nevermind
          format.html { redirect_to login_path, notice: "Hopefully you can remember your credentials." }
  		  end
      
      end
	  end
  end

  def create
  	# not sure
  end

  def destroy
  	# log out/remove sessions entry from database
  	
  	
  end
end
