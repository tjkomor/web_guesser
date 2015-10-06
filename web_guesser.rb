require 'sinatra'
require 'sinatra/reloader'


NUMBER = rand(100)
get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals =>{:number => NUMBER, :message => message}
end


def check_guess(guess)
  if (guess.to_i - NUMBER) > 20
    "Way Too High!"
  elsif (guess.to_i - NUMBER) < -20
    "Way Too Low!"
  elsif guess.to_i > NUMBER
    "Too High!"
  elsif guess.to_i < NUMBER
    "Too Low!"
  else
    message = "The SECRET NUMBER is #{NUMBER}. You got it right!"
  end
end
