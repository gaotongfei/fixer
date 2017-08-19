require 'ostruct'

require 'httparty'

require "fixer/version"
require "fixer/request"

module Fixer
  class << self
    attr_accessor :base
  end
end
