class UsersController < ApplicationController
  def dashboard
    skip_authorization
    if user_signed_in?
      @services = current_user.services
      @bookings = current_user.bookings
    end
  end

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
