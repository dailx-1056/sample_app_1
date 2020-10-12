class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "message.user.cant_find_user"
      @users = User.all
      render "index"
    else
      flash[:success] = t "message.welcome_message"
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "message.welcome_message"
      redirect_to @user
    else
      flash.now[:danger] = t "message.user.fail"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
