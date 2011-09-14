require "rubygems"
require "bundler/setup"
require "pathname"
require "yaml"

Bundler.require(:default) # FU, I'm lazy

module PizzaBoy
  def root
    Pathname.new(File.expand_path("../", File.dirname(__FILE__)))
  end

  def lib
    root + "lib"
  end

  def config
    @config ||= YAML.load_file(root + "config/pizzaboy.yml")
  end

  def scamp
    @scamp ||= Scamp.new(default_args)
  end

  def default_args
    {
      :api_key => config[:api_key],
      :subdomain => config[:subdomain],
      :verbose => true,
      :first_match_only => true
    }
  end

  def guts &block
    scamp.behaviour &block
    scamp.connect! config[:rooms]
  end

  extend self
end

require PizzaBoy.lib + "pizzaboy/guts"
