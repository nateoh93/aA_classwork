class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.all
    render :index
  end

  def show
    @guest = Guest.find_by(id: params[:id])
    render :show
  end

  # Another way to show guest information wrapped inside of a guest object
  # json.guest do 
  #     json.name @guest.name
  #     json.age @guest.age
  #     json.favorite_color @guest.favorite_color
  # end 
end
 