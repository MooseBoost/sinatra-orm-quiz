require 'pry'

class TestApp < Sinatra::Base
  post '/profile' do
    "<h1>#{params[:name]}</h1><h2>#{params[:occupation]}</h2>"
  end

  get '/search' do
    # DO NOT MODIFY THIS!
    "#{params[:q]} #{params[:order]}"
  end
  
  get '/' do
  end
  
  post '/' do
  end
  
  get '/zig' do
    redirect '/zag'
  end
  
  get '/zag' do
  end
  
  get '/hello/:name' do
    name = params[:name]
    "Hello #{name}!"
  end
  
end
