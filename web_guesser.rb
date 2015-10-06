require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
@color = nil

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals =>{:number => NUMBER, :message => message, :color => @color}
end


def check_guess(guess)
  if (guess.to_i - NUMBER) > 20
    @color = "background: DarkSeaGreen;"
    "Way Too High!"
  elsif (guess.to_i - NUMBER) < -20
    @color = "background: DodgerBlue;"
    "Way Too Low!"
  elsif guess.to_i > NUMBER
    @color = "background: DeepPink;"
    "Too High!"
  elsif guess.to_i < NUMBER
    @color = "background: SlateBlue;"
    "Too Low!"
  else
    @color = "background: DarkOrange;"
    message = "The SECRET NUMBER is #{NUMBER}. You got it right!"
  end
end
