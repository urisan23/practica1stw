require 'sinatra'
require 'haml'

# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform
before do
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/throw/:type' do
  # the params hash stores querystring and form data
  @player_throw = params[:type].to_sym

  halt(403, "You must throw one of the following: '#{@throws.join(', ')}'") unless @throws.include? @player_throw

  @computer_throw = @throws.sample

  if @player_throw == @computer_throw 
    @answer = "There is a tie"
    haml :index
  elsif @player_throw == @defeat[@computer_throw]
    @answer = "Computer wins; #{@computer_throw} defeats #{@player_throw}"
    haml :index
  else
    @answer = "Well done. #{@player_throw} beats #{@computer_throw}"
    haml :index
  end
end
__END__

@@index
%html
  %head
    %title Rock Paper Scissors
  %body
    %h2 Computer chooses:  #{@computer_throw}
    %h2 You choose: #{@player_throw}
    %h1= @answer
