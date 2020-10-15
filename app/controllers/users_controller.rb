class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update index destroy)
  before_action :get_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per Settings.pagination.per_page
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "message.welcome_message"
      redirect_back_or @user
    else
      flash.now[:danger] = t "message.user.create_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "message.user.update_success"
      redirect_to @user
    else
      flash.now[:danger] = t "message.user.update_fail"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "message.user.delete_success"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def get_user
    @user = User.find_by id: params[:id]
    return if @user

    flash.now[:danger] = t "message.user.cant_find_user"
    redirect_to users_url
  end

  def logged_in_user
    return if loged_in?

    store_location
    flash[:danger] = t "message.require_login"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
