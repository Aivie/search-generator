require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    @title = "Homepage"
    erb :index, :layout => :base
  end

  post '/result' do 
    @gif_result = check_input(params[:user_input])
    @movie_result = find_movie(params[:user_input]) 
    @food_result = food_search(params[:user_input])
    @movie_result = find_movie(params[:user_input])
    erb :result, :layout => :base
  end


# get '/www.imdb.com/title/#{@movie_id}/' do
#     "Hello World"
#   end

end
