class SessionsController < ApplicationController
  def new
  	respond_to do |format|
  		format.html { redirect_to login_path, notice: "Login form not setup!" }
  	end
  end

  def create
  end

  def destroy
  end
end
