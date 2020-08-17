# frozen_string_literal: true

module LoginHelper
  def after_login_path(user)
    default = user.after_login_path

    return params[:after_login_path] if params[:after_login_path].present?

    default
  end
end
