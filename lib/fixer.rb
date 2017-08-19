require 'ostruct'

require 'httparty'

require "fixer/version"
require "fixer/request"
require "./lib/extensions/open_struct/format"

OpenStruct.include Extensions::OpenStruct::Format

module Fixer
  class << self
    attr_accessor :base
  end
end
