class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, :check_expiration, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "message.email_reset_instruction"
      redirect_to root_url
    else
      flash.now[:danger] = t "message.missing_email_address"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add :password, t("no_empty")
      render "edit"
    elsif @user.update(user_params)
      log_in @user
      @user.update_attribute :reset_digest, nil
      flash[:success] = t "password_reseted"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def get_user
    @user = User.find_by email: params[:email]
    return if @user&.activated

    flash.now[:danger] = t "message.user.cant_find_user"
    redirect_to users_url
  end

  def valid_user
    return if user&.activated?&.authenticated? :reset, params[:id]

    redirect_to root_url
  end

  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = t "reset_expired"
    redirect_to new_password_reset_url
  end
end
