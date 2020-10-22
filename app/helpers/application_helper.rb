module ApplicationHelper
  def full_title page_title
    base_title = [t("tutorial"), t("sample_app")].join(" ")
    page_title.blank? ? base_title : [page_title, base_title].join(" | ")
  end

  def get_user_by_id
    @user = User.find_by id: params[:id]
    return if @user

    flash.now[:danger] = t "message.user.cant_find_user"
    redirect_to root
  end
end
