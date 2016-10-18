class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params)
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  delete '/users/:id/removerestaurant' do
    @ur = UserRestaurant.find_by(user_id: params[:id])
    @ur.delete
    redirect "/users/#{params[:id]}"
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit'
  end

  patch '/users/:id/edit' do
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.save
    redirect "/users/#{params[:id]}"
  end

end
