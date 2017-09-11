require 'sinatra'
require 'sinatra/reloader'


get '/' do
  "the secret number is #{rand(100)}"
end