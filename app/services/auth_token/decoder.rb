module AuthToken
  class Decoder
    def self.call(token)
      JWT.decode(token, ENV['AUTH_TOKEN_SECRET'])[0]

    rescue
      nil
    end
  end
end
