# frozen_string_literal: true

module LoginHelper
  def after_login_path(user)
    default = user.after_login_path

    return default unless params[:after_login_path].present?

    if params[:after_login_path].include?('partner') && !user.partner?
      default
    else
      params[:after_login_path]
    end
  end
end
