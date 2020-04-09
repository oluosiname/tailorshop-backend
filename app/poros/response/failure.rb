class Response::Failure < Response::Base
  attr_reader :errors

  def initialize(errors)
    @errors = errors
  end
end