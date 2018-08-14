class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    skip_authorization
    @booking = Booking.new(booking_params)
    @booking.service = Service.find(params[:service_id])
      if @booking.save
        redirect_to service_path(@booking.service), notice: "Your request has been sent!"
      else
        redirect_to service_path(@booking.service), alert: "Please fill out all fields"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:status)
  end
end
