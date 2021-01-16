class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :something, only: [:show]
  #CRUD

  #READ
  #READ ALL
  def index
    #See all my restaurants
    #Retreive all the restaurants from the DB
    @restaurants = Restaurant.all
  end

  #READ ONE
  def show
    # Retreive the restaurant I want to see -> Based on the ID
    @restaurant = Restaurant.find(params[:id])
  end

  #CREATE

  #Show to my user a form
  def new
    @restaurant = Restaurant.new
  end

  #Save the restaurant ion the DB
  def create
    #IOnstanciate a new restaurant
    @restaurant = Restaurant.new(restaurant_params)
    #Pass to the restaurant the parameters
    #save the restaurant
    @restaurant.save
    redirect_to restaurants_path
  end

  #UPDATE
  #Show to my user a form
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  #Update information in the DB
  def update
    #Update my restaurant
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  #Delete a restaurant
  def destroy
    #Find the restaurant to destroy
    #Delete the restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def something
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    #Permit PArams for my restaurant
    params.require(:restaurant).permit(:name, :rating)
  end

end
