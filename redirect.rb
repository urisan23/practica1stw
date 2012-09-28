require 'sinatra'

get '/redir' do
   redirect 'http://www.google.com'
end
