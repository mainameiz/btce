require 'json'
require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'
require "active_support/all"

require "btce/version"

module Btce

  mattr_accessor :address
  self.address = "https://btc-e.com/tapi"

  mattr_accessor :uri
  self.uri = URI.parse self.address

  mattr_accessor :http
  self.http = Net::HTTP.new self.uri.host, self.uri.port
  self.http.use_ssl = true
  #self.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  def self.new(key, secret)
    Core.new(key, secret)
  end

  def self.btc_usd
    @btc_usd ||= Public::Pair.new("btc_usd")
  end

  def self.btc_rur
    @btc_usd ||= Public::Pair.new("btc_rur")
  end

  def self.ltc_usd
    @btc_usd ||= Public::Pair.new("ltc_usd")
  end

  def self.ltc_rur
    @btc_usd ||= Public::Pair.new("ltc_rur")
  end
end

require "btce/utils"
require "btce/core"
require "btce/http"
require "btce/info"
require "btce/trans_history"
require "btce/public"
