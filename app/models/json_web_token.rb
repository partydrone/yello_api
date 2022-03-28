class JsonWebToken
  SECRET = Rails.application.secrets.secret_key_base

  class << self
    def encode(payload)
      expiration = 1.day.from_now.to_i
      JWT.encode payload.merge(exp: expiration), SECRET
    end

    def decode(token)
      body = JWT.decode(token, SECRET).first
      HashWithIndifferentAccess.new body
    end
  end
end
