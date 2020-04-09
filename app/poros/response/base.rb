class Response::Base
  def success?
    false
  end

  def errors
    []
  end
end