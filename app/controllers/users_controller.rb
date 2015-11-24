class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @microposts = @user.microposts
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
    if @user == current_user
       render 'edit'
    else
       redirect_to root_url
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
         flash[:success] = "Updated user information"
         redirect_to user_path(current_user)
      else
         render 'edit'
      end
    else
       redirect_to root_url
    end
  end
  
  def followings
    @user = User.find_by(id: params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find_by(id: params[:id])
    @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :area, :profile, :password_confirmation)
  end
end
