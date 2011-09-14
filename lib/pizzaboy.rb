require "rubygems"
require "bundler/setup"
require "pathname"
require "yaml"

Bundler.require(:default) # FU, I'm lazy

module PizzaBoy
  def root
    Pathname.new(File.expand_path("../", File.dirname(__FILE__)))
  end

  def config
    @config ||= YAML.load_file(root + "config/pizzaboy.yml")
  end

  def scamp
    @scamp ||= Scamp.new(:api_key => config[:api_key], :subdomain => config[:subdomain])
  end

  def guts &block
    scamp.behaviour &block
    scamp.connect! config[:rooms]
  end

  extend self
end

# PizzaBoy.scamp.print_channels
# 364968: "Casual"
# 360387: "Main"
# 364627: "Support Room"

require "pizzaboy/guts"
