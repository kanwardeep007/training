class MainsController < ApplicationController
  def index
  end

  def create
    # debugger
    #field is the word by which to search tweet
    @field = params[:searched][:field]
    @tweets = TwitterApi.find_tweets(@field)
    
  end
  # private
  #   def find_tweets(field)
  #     client
  #   end
end
