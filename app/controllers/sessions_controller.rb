class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user &.authenticate params[:session][:password]
      activate user
    else
      flash.now[:danger] = t "message.user.login_fail"
      render :new
    end
  end

  def destroy
    log_out if loged_in?
    redirect_to root_url
  end

  def check_remember remember_me, user
    remember_me == "1" ? remember(user) : forget(user)
  end

  private

  def activate user
    if user.activated
      log_in user
      check_remember params[:session][:rememberme], user
      redirect_back_or user
    else
      flash[:warning] = t "message.account_not_activated"
      redirect_to root_url
    end
  end
end
