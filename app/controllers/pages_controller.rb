class PagesController < ApplicationController
  def home
  end

  def signup
  end

  def about
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
