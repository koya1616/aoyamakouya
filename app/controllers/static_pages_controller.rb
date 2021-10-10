class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @tweet = current_user.tweets.build
      @tweets = Tweet.all.order(created_at: "DESC").paginate(page: params[:page], per_page: 10)
    end
  end

  def help
  end

  def show
    @tweet_new = Tweet.new
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @tweet_comment = TweetComment.new  
  end
  

  def about
  end
end