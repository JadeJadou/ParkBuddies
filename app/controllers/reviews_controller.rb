class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @buddy = User.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @buddy = User.find(params[:id])
    @review.user = @buddy
    if @review.save
      redirect_to buddy_path(@review.user)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
