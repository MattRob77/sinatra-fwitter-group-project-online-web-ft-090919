class UsersController < ApplicationController

  get '/users' do

    erb :index
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to('/tweets')
    end

  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect to('/tweets')
    else
      redirect to('/login')
    end
  end


  post '/signup' do

    user = User.new(params)

    if user.save
      session[:user_id] = user.id
      redirect to('/tweets')
    else
      redirect to('/signup')
    end

  end

  get '/logout' do
    # logged_in? ? (erb :'users/logout') : (redirect to('/'))
    if logged_in?
      session.destroy
      redirect to('/login')
    else
      redirect to('/')
    end
  end

  get '/users/:slug' do
   @user = User.find_by_slug(params[:slug])
   erb :'users/show'
 end

end