class ReviewsController < ApplicationController

  def index
    skip_policy_scope
    @service = Service.find(params[:service_id])
    @reviews = Review.where(service_owner: @service.user)
  end

  def new
    skip_authorization
    @booking = Booking.find(params[:booking_id])
    @service = @booking.service
    @review = Review.new
  end

  def create
    skip_authorization
    #review.user = booking.service.user_id
    @booking = Booking.find(params[:booking_id])
    @service_owner = @booking.service.user

    @attributes = review_params

    @review = Review.new(review_params)
    @review.service_owner = @service_owner
    @review.booking = @booking

    if @review.save
      redirect_to dashboard_path(anchor: 'myBookings')
    end

  end

  private
  def review_params
    params.require(:review).permit(:comments, :stars)
  end


end
