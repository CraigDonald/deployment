require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    @name = params[:name]
    if @name.match?(/[<>]/)
      return 'Wrong input'
    else
      @name.gsub!(/[^0-9A-Za-z]/, '')
      return erb(:hello)
    end
  end
end
