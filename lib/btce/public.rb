module Btce
  module Public
    mattr_accessor :address
    self.address = "https://btc-e.com/api/2/%{pair}/%{method}"
  end
end

require "btce/public/pair"
require "btce/public/ticker"
