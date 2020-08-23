# frozen_string_literal: true

module ApiResponse
  def unauthorized!
    render json: { errors: 'Unauthorized' }, status: 401
  end

  def error!(errors)
    render json: { errors: errors }, status: 422
  end
end
