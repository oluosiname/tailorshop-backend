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
  JSON.parse(response.body)["errors"]
end