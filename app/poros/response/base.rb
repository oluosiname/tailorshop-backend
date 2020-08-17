# frozen_string_literal: true

class Response::Base
  def success?
    false
  end

  def errors
    raise 'Not Implemented'
  end
end
