module Btce
  class Utils

    delegate :key, to: :@core
    delegate :secret, to: :@core

    def initialize(core)
      @core = core

      @current_nonce = nil
    end

    def nonce
      nonce = nil

      while true
        nonce = Time.now.to_i

        if @current_nonce == nonce
          sleep 1
        else
          @current_nonce = nonce
          break
        end
      end

      @current_nonce
    end

    def sign(params)
      self.class.sign(params, secret)
    end

    def self.sign(params, secret)
      hmac = OpenSSL::HMAC.new(secret, OpenSSL::Digest::SHA512.new)
      params = params.collect {|k,v| "#{k}=#{v}"}.join('&')
      hmac.update params
    end
  end
end
