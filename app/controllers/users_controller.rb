class UsersController < ApplicationController
  def dashboard
    skip_authorization
    if user_signed_in?
      # services created by current_user
      @services = current_user.services
      @bookings = []

      # all bookings for those services
      @services.each do |service|
        @bookings << service.bookings
      end
      @bookings.flatten!
    end
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
