require 'sinatra'
require 'erb'

before do
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/' do
    erb :index
end
get '/throw/' do

  @opcion = params['option'.to_sym].downcase
  @player_throw = @opcion.to_sym

  halt(403, "You must throw one of the following: '#{@throws.join(', ')}'") unless @throws.include? @player_throw

  @computer_throw = @throws.sample

  if @player_throw == @computer_throw 
    @answer = "There is a tie"
  elsif @player_throw == @defeat[@computer_throw]
    @answer = "Computer wins; #{@computer_throw} defeats #{@player_throw}"
  else
    @answer = "Well done. #{@player_throw} beats #{@computer_throw}"
  end
  erb :result
end
