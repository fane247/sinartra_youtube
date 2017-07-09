require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/youtube_controller.rb'
require 'rack'

use Rack::MethodOverride
run YoutubeController
