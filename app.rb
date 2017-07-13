require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
set :bind, '192.168.0.163'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @usernames = [ 'ssaunier', 'Papillard' ]
  erb :index
end

get '/about' do
  erb :about
end

get '/team/:username' do
  puts params[:username]
  "The username is #{params[:username]}"
end
