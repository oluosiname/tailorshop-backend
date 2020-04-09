class Response::Success < Response::Base
  def initialize(result, result_name = 'value')
    define_singleton_method result_name do
      result
    end
  end

  def success?
    true
  end
end