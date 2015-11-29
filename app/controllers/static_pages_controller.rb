class StaticPagesController < ApplicationController
  def home
    @user = current_user if logged_in?
    @micropost = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc) if logged_in?
  end
end
