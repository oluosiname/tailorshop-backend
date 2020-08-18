# frozen_string_literal: true

module AuthToken
  class Encoder
    def self.call(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV['AUTH_TOKEN_SECRET'])
    end
  end
end
