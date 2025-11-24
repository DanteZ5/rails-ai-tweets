class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    chat = RubyLLM.chat
    response = chat.ask("Please shorten this text into a tweet of maximum 260 characters: #{@tweet.long}")
    @tweet.shortened = response.content

    
    if @tweet.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:long)
  end
end
