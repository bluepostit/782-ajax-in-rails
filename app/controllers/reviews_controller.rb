class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}") }
      else
        format.html { render 'restaurants/show' }
      end
      format.json
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
