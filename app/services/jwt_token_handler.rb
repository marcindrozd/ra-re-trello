class JwtTokenHandler
  ALGORITHM = 'HS256'

  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
    end

    def decode(token)
      body, _ = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: ALGORITHM)
      HashWithIndifferentAccess.new(body)
    rescue JWT::ExpiredSignature
      nil
    end
  end
end
