class ServicesController < ApplicationController
  def index
    @services = policy_scope(Service).order(created_at: :desc)
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
  authorize @service
end
