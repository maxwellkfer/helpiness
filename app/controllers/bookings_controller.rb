class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def accept
    skip_authorization
    @booking = Booking.find(params[:booking_id])
    if @booking.accepted!
      unless @booking.customer.helpies < 0
       @customer = @booking.customer
       @customer.helpies -= @booking.service.helpies
       @customer.save

       @user = @booking.service.user
       @user.helpies += @booking.service.helpies
       @user.save
      end
    end
    redirect_to(dashboard_path(anchor: 'requests')) and return
  end



  def decline
    skip_authorization
    @booking = Booking.find(params[:booking_id])
    @booking.declined!
    redirect_to dashboard_path(anchor: "/dashboard#requests")
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    skip_authorization
    @service = Service.find(params[:service_id])
    if current_user.helpies < @service.helpies
      redirect_to service_path(@service), alert: "You don't have enough helpies!"
    else
      @booking = Booking.new(booking_params)
      @booking.customer = current_user
      @booking.service = Service.find(params[:service_id])
        if @booking.save
          redirect_to service_path(@booking.service), notice: "Your request has been sent!"
        else
          redirect_to service_path(@booking.service), alert: "Please fill out all fields"
        end
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
    params.require(:booking).permit(:user_id, :service_id)
  end
end
