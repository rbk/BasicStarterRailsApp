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
  	# command = params[:command]
  	# if command
  	# 	@output = %x[ #{command} ]
  	# else
  	# 	@output = ''
  	# end
  end
end
