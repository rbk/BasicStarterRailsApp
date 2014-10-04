class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy, :show ]
  before_action :authenticate

  def index
  	@users = User.all
  end

  def edit
  end

  def show
  end

  def new
  	@user = User.new
  end

  def update
  	respond_to do |format|
	  	if @user.update(user_params)
	  		format.html { redirect_to users_path, notice: 'User updated.' }
	  	else
	  		format.html { redirect_to edit_user_path(@user), notice: 'Cannot save.' }
	  		format.json { render json: @user.errors, status: :unprocessable_entity }
	  	end	
  	end
  end
  def create
  	@user = User.new(user_params)
  	respond_to do |format|
  		if @user.save(user_params)
  			format.html { redirect_to users_path, notice: 'User created!' }
  		else
  			format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  	end
  end
  def destroy
  	@user.destroy
  	respond_to do |format|
  		format.html { redirect_to users_path, notice: 'User deleted' }
  	end
  end

  private

	  def set_user
	  	@user = User.find( params[:id] )
	  end
	  def user_params
  		params.require(:user).permit(:email, :first_name, :last_name, :age, :sex, :password, :group)
	  end

end
