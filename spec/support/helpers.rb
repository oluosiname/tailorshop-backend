# frozen_string_literal: true

def with_env(envs)
  envs.each do |key, value|
    ENV[key] = value
  end

  yield

  envs.each do |key, _value|
    ENV[key] = nil
  end
end

def json_body
  JSON.parse(response.body)
end

def api_error
  JSON.parse(response.body)['errors']
end

def http_status
  response.status
end

def sign_in_user(user)
  allow(ENV).to receive(:[]).and_call_original
  allow(ENV).to receive(:[]).with('AUTH_TOKEN_SECRET').and_return('xyz')
  SigninUser.call(user)
end
