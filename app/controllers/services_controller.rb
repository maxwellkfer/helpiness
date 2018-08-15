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
<<<<<<< HEAD

=======
>>>>>>> 9d58d8c344dca733ac502087dd0c7ae1d7bfb8aa
    @service = Service.find(params[:id])
    authorize @service
  end

  def new
    @service = Service.new
    authorize @service
  end


  def create
    @service = Service.new(service_params)
<<<<<<< HEAD
    @service.user = current_user
    authorize @service

    if @service.save
      redirect_to service_path(@service)
    else
      render :new, error: "Failed to save"
    end


=======

    authorize @service
    if @service.save
      redirect_to services.services_path
    else
      render :new
    end
>>>>>>> 9d58d8c344dca733ac502087dd0c7ae1d7bfb8aa
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
