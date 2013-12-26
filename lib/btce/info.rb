module Btce
  class Info

    delegate :key, to: :@core
    delegate :secret, to: :@core
    delegate :utils, to: :@core
    delegate :http, to: :@core

    def initialize(core)
      @core = core
    end

    def get
      params = { method: "getInfo" }

      http.request Btce.uri, params
    end
  end
end
