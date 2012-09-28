require 'sinatra'
require 'erb'

<<<<<<< HEAD
set :session_secret, ENV["SESSION_KEY"] || 'top secret'

# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform

enable :session

helpers do
    include Rack, Utils
    alias_method :h, 
end
    
    
=======
# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform
>>>>>>> a4d01e931d5cd14ec06d93a0b49e15ea9bc61fd0
before do
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

<<<<<<< HEAD
get '\/' do
   erb :intro
end

get '/throw' do
   redirect "/throw/#{@params[:play].to_sym}"
end

=======
>>>>>>> a4d01e931d5cd14ec06d93a0b49e15ea9bc61fd0
get '/throw/:type' do
  # the params hash stores querystring and form data
  @player_throw = params[:type].to_sym

  halt(403, "You must throw one of the following: '#{@throws.join(', ')}'") unless @throws.include? @player_throw

  @computer_throw = @throws.sample

  if @player_throw == @computer_throw 
    @answer = "There is a tie"
<<<<<<< HEAD
  elsif @player_throw == @defeat[@computer_throw]
    @answer = "Computer wins; #{@computer_throw} defeats #{@player_throw}"
  else
    @answer = "Well done. #{@player_throw} beats #{@computer_throw}"
  end
  erb :index
end

=======
    erb :index
  elsif @player_throw == @defeat[@computer_throw]
    @answer = "Computer wins; #{@computer_throw} defeats #{@player_throw}"
    erb :index
  else
    @answer = "Well done. #{@player_throw} beats #{@computer_throw}"
    erb :index
  end
end
__END__

@@index
<html>
  <head>
    <title>Rock Paper Scissors</title>
  </head>
  <body>
    <h2> Computer chooses:  <%= @computer_throw %> </h2>
    <h2> You choose: <%= @player_throw %> </h2>
    <h1> <%= @answer %> </h1>
  </body>
</html>
>>>>>>> a4d01e931d5cd14ec06d93a0b49e15ea9bc61fd0
