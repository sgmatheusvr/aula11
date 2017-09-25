class TweetsController < ApplicationController
    before_action :authenticate_user!
   
  def index
    @tweets = Tweet.all
  end

 
  def show
      @tweet = Tweet.find(params[:id])
  end

  
  def new
    @tweet = current_user.tweets.new
  end

  
  def edit
      @tweet = current_user.tweets.find(params[:id])
  end

 
  def create
    @tweet = current_user.tweets.new(tweet_params)

      if @tweet.save
        redirect_to @tweet, notice: 'Tweet was successfully created.'

      else
        render :new
     end
  end

  
  def update
     @tweet = current_user.tweets.find(params[:id])
    
      if @tweet.update(tweet_params)
       redirect_to @tweet, notice: 'Tweet was successfully updated.'
      else
       render :edit
    end
  end

  
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
   
     redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'

  end
    
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:conteudo)
    end

 
end
