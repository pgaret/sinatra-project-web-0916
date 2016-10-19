class RestaurantsController < ApplicationController

  # get '/restaurants' do
  #   @restaurants = Restaurant.all
  #   erb :'/restaurants/index'
  # end

  get '/restaurants' do

    search = Yelp.client.search('San Francisco').businesses
    search.each do |restaurant|
      Restaurant.find_or_create_by(name: restaurant.name, rating: restaurant.rating, address: restaurant.location.address.first)
    end
    erb :'/restaurants/index'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params)
    redirect "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/new' do
    erb :'/restaurants/new'
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all.select {|user| !user.restaurants.include?(@restaurant)}
    erb :'/restaurants/show'
  end

  post '/restaurants/:id/adduser' do
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:users])
    UserRestaurant.create(restaurant_id: @restaurant.id, user_id: @user.id)
    redirect "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/edit'
  end

  patch '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.save
    redirect "/restaurants/#{params[:id]}"
  end

end
