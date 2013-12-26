module Btce
  class Core

    attr_reader :key
    attr_reader :secret

    def initialize(key, secret)
      @key = key
      @secret = secret
    end

    def info
      @info ||= Info.new(self)
      @info.get
    end

    def utils
      @utils ||= Utils.new(self)
    end

    def http
      @http ||= Http.new(self)
    end

    def trans_history(params = nil)
      @trans_history ||= TransHistory.new(self)
      @trans_history.get(params)
    end
  end
end
