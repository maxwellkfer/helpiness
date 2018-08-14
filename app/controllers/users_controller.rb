class UsersController < ApplicationController
  def dashboard
    skip_authorization
    if user_signed_in?
      @services = current_user.services
      @bookings = current_user.bookings
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
