class FollowersController < ApplicationController
  include ApplicationHelper

  before_action :get_user_by_id

  def index
    @title = t "followers"
    @users = @user.followers.page(params[:page]).per Settings.page
    render "/users/show_follow"
  end
end
