class FavoritesController < ApplicationController
  def create
    @park = Park.find(params[:park_id])
    @favorite = Favorite.new(park: @park, user: current_user)
    if @favorite.save
      redirect_to park_path(@park)
    else
      render "parks/show"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to park_path(@favorite.park)
  end

end
