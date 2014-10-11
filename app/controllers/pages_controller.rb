class PagesController < ApplicationController

  before_action :authenticate_admin, only: [ :routes, :terminal, :access_log ]
  before_action :authenticate, only: [ :account ]

  def home
  end

  def signup
  end

  def about
  end

  def access_log
     @access = AccessLog.all.order(:created_at).reverse_order
  end

  def account
    @sessions = Session.all
    # FirstMailer.welcome_mail.deliver
    # respond_to do | format |
    #   format.xml { render xml: @sessions }
    #   # format.json { render json: @sessions.to_json }
    # end

    # This work to render json directly:
      # render json: @sessions
      # return
    
    # Respond to multiple formats
    respond_to do |format|
      format.html
      format.xml { render xml: @sessions }
    end
  end

  def routes
  	@string  = %x[ rake routes ]
  end

  def terminal
    # if params[:command] && request.env['REMOTE_ADDR'] == '68.0.83.113'
    if params[:command]
      command = params[:command].gsub(/sudo\s/i, '')
      command = command.gsub(/rm/i, '')
      command = command.gsub(/rm -rf/i, '')
    	# if command
    	# 	@output = %x[ #{command} ]
    	# else
    	# 	@output = ''
    	# end
      @output = 'Terminal Disabled.'
    end
  end
end
