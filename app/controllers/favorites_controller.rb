class FavoritesController < ApplicationController
    before_action :logged_in_user

  def create
    @micropost = User.find(params[:favorited_id])
    current_user.favorite(@micropost)
  end

  def destroy
    @micropost = current_user.favorite_relationships.find(params[:favorited_id])
    current_user.unfavorite(@micropost)
  end

end