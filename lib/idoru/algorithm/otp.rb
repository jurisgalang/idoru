module Idoru
  module Algorithm
    def self.OTP type, secret, length = 6, interval = 30, crypto = 'sha1'
      algorithm = const_get(type.upcase)
      algorithm.new(secret, length, interval, crypto)
    end
  end
end
