class ServicesController < ApplicationController

  def index
    @services = policy_scope(Service).order(created_at: :desc)


    if params[:query].present?
      @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end

  end

  def show
    @service = Service.find(params[:id])
    sum = 0
    Review.all.where(service_owner: @service.user).each do |review|
      sum = sum + review.stars
    end
    count = Review.all.where(service_owner: @service.user).count
    @service.user.rating = (sum/count)
    authorize @service
    @review = Review.new
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
# byebug
    if @service.save
      redirect_to service_path(@service)
    else
      render :new, error: "Failed to save"
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    authorize @service
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path
    else
      render :edit
    end
  end

  def destroy
    authorize @service
    @service.user = current_user
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to service_path
  end

  private

  def service_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:service).permit(:name,:helpies, :description, :photo, :photo_cache, :user_id, :category_id)

  end
end
