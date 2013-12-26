module Btce
  module Public
    class Pair

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def ticker
        @ticker ||= Ticker.new(self)
        @ticker.get
      end
    end
  end
end

