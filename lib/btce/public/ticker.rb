module Btce
  module Public
    class Ticker
      def initialize(pair)
        @pair = pair
      end

      def get
        Http.request Public.address % { pair: @pair.name, method: :ticker }
      end
    end
  end
end
