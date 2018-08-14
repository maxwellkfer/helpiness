class ReviewsController < ApplicationController
  def create
    @review = Review.find(params[:restaurant_id])
    @review = Review.new(review_params)
  end

  def edit
    # we dont want to redirct to another page to make edits, using ajax to make edits on the page
  end

  def update
    # the only person that should be able to edit the review is Admin and the person who created it
  end

  def destroy
    # the only person that should be able to delete the review is Admin and the person who created it
  end

  def review_params
    params.require(:review).permit(:comments, :stars)
  end
end
