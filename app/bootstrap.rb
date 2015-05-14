ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'routes/index'
require_relative 'routes/offers'

module OfferWall
  class Bootstrap < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :public_folder, Proc.new { File.join(root, '/assets') }

    register OfferWall::Routes::Index
    register OfferWall::Routes::Offers
  end
end
