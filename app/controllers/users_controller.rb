class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)

  	if @user.save
  	  session[:user_id] = @user.id
  	  flash[:notice] = "Register success!"
  	  redirect_to root_path
  	else
  	  render :new
  	end
  end
  def update
  end
  def edit
  end

  def user_params
  	params.require(:user).permit(:username, :password) #, :password_confirmation)
  end
end