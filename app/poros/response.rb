class Response
  attr_reader :errors, :result

  def initialize(success, errors, result, result_name = 'value')
    @success = success
    @errors = errors
    @result = result

    define_singleton_method result_name do
      result
    end
  end

  def success?
    @success
  end
end