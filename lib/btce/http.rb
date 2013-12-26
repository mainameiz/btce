module Btce
  class Http

    delegate :key, to: :@core
    delegate :secret, to: :@core
    delegate :utils, to: :@core

    delegate :http, to: Btce
    delegate :uri, to: Btce

    def initialize(core)
      @core = core

      #@uri = URI.parse Btce.address
      #@http = Net::HTTP.new @uri.host, @uri.port
      #@http.use_ssl = true
      #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def request(uri, params = nil)
      params = params.merge(nonce: utils.nonce)
      request = Net::HTTP::Post.new uri.request_uri
      request.add_field "Key", key
      request.add_field "Sign", utils.sign(params)
      request.set_form_data params

      response = http.request request
      JSON.load response.body
    end

    def self.http
      Btce.http
    end

    def self.request(uri)
      uri = URI.parse uri
      request = Net::HTTP::Get.new uri.request_uri
      response = http.request request
      JSON.load response.body
    end
  end
end
