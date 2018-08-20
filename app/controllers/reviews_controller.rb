class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      respond_to do |format|
        format.html { redirect_to service_path(@service) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'services/show' }
        format.js
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @review.user = current_user
    # the only person that should be able to delete the review is Admin and the person who created it
  end

  private

  def review_params
    params.require(:review).permit(:comments, :stars)
  end
end
