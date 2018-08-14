class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to @booking.service
    else
      render 'services/show'
    end
  end
  def edit
    # we dont want to redirct to another page to make edits, using ajax to make edits on the page
  end
  def update
    # the only person that should be able to edit the review is Admin and the person who created it
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @review.user = current_user
    # the only person that should be able to delete the review is Admin and the person who created it
  end
  def review_params
    params.require(:review).permit(:comments, :stars)
  end
end
