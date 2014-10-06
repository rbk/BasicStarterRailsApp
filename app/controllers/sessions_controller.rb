class SessionsController < ApplicationController

  before_action :authenticate, only: [ :destroy ]
  
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

        if stored_password == password

          user_session = Session.where("user_id = ? AND ip = ?", user.id, request.env['REMOTE_ADDR'])

          # user_session = Session.find_by_user_id(user.id)
          if user_session.any?
            format.html { redirect_to login_path, notice: "It seems that you have done this before." }          
          else
            Session.create({user_id: user.id, email: user.email, group: user.group, ip: request.env['REMOTE_ADDR'] }) 
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

  def destroy
  	# log out/remove sessions entry from database
    Session.where(:user_id => session[:user_id], :ip => request.env['REMOTE_ADDR'] ).destroy_all
    session[:user_id] = nil
    session[:group] = nil
    redirect_to login_path, notice: "You are logged out!"
  	
  end
  def index
    @sessions = Session.all
  end
end
