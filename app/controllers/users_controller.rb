class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user == nil
      flash[:danger] = "Couldn't find user"
      redirect_to root_path
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Updated user information"
      redirect_to user_path
    else render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :area, :profile, :password_confirmation)
  end
end
