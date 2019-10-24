class TweetsController < ApplicationController

  get '/tweets' do
    redirect_if_not_logged_in
    @tweets = Tweet.all
    erb :'tweets/tweets'
  end

  post '/tweets' do
    if params[:content].empty?
      redirect to('/tweets/new')
    else
      tweet = current_user.tweets.new(params)

      tweet.save
      redirect to("/tweets/#{tweet.id}")
    end
  end

  get '/tweets/new' do
    redirect_if_not_logged_in
    erb :'tweets/new'
  end

  get '/tweets/:id' do
    redirect_if_not_logged_in
    @tweet = Tweet.find_by(id: params[:id])
    erb :'tweets/show'
  end

  patch '/tweets/:id' do
    tweet = Tweet.find_by(id: params[:id])
    if tweet && tweet.user == current_user
      tweet.update(params[:tweet])
      tweet.save
    else
      redirect to("/tweets/#{tweet.id}")
    end
  end

  get '/tweets/:id/edit' do
    redirect_if_not_logged_in
    @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        erb :'tweets/edit'
      else
        redirect to '/tweets'
      end
  end


end