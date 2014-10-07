class SessionsController < ApplicationController

  before_action :authenticate, only: [ :destroy ]
  before_action :authenticate_admin, only: [:index]
  
  def new
  	
    email    = params[:email].downcase || ''
  	password = params[:password] || ''

  	user = User.find_by_email email

    # Log the attempt
    access = AccessLog.new({email: email, ip_address: request.env['REMOTE_ADDR'], http_user_agent: request.env['HTTP_USER_AGENT']})

    # don't run the rest of this stuff if either email or password is empty
    if !user || !password
      redirect_to login_path, notice: "Hopefully you can remember your credentials."
      access.outcome = 'failure'
      access.save
      return
    end

    # if BCrypt::Password.new(user.password) != password
    #   redirect_to login_path, notice: "Hopefully you can remember your credentials."
    #   access.outcome = 'failure'
    #   access.save
    #   return
    # end
    
    respond_to do |format|
        # validate password if user is found and password is given
        stored_password = BCrypt::Password.new(user.password)

        if stored_password == password

          user_session = Session.where("user_id = ? AND ip = ?", user.id, request.env['REMOTE_ADDR'])

          if user_session.any?
            format.html { redirect_to login_path, notice: "It seems that you have done this before." }          
          else
            Session.create({user_id: user.id, email: user.email, group: user.group, ip: request.env['REMOTE_ADDR'] }) 
            format.html { redirect_to login_path, notice: "Login Successful! Welcome back!" }
          end

          access.outcome = 'success'
          access.save
          session[:user_id] = user.id
          session[:group] = user.group

  		  else

          # passwords don't match for this user so nevermind
          format.html { redirect_to login_path, notice: "Hopefully you can remember your credentials." }
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
    @access = AccessLog.all
  end

end
