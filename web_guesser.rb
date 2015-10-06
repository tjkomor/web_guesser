require 'sinatra'
require 'sinatra/reloader'


number = 12
get '/' do
  guess = params["guess"].to_i
  erb :index, :locals => {:number => number}
end
