class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:update, :edit]
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
  	if @user.update(user_params)
  	  flash[:notice] = 'Your profile was updated'
  	  redirect_to user_path(@user)
  	else
  	  render :edit
  	end
  end
  def edit
  	
  end

  def show

  end

  def user_params
  	params.require(:user).permit(:username, :password) #, :password_confirmation)
  end

  def set_user
  	@user = User.find(params[:id])
  end

  def require_same_user
  	if current_user != @user
  		flash[:error] = "You are not allowed to edit other user!"
  		redirect_to root_path
  	end
  end
end