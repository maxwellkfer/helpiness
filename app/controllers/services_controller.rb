class ServicesController < ApplicationController

  def index
    @services = policy_scope(Service).order(created_at: :desc)
  end

  def show
    authorize @service
    @service = Service.find(params:[id])
  end

  def new
    @service = Service.new
    authorize @service
  end


  def create
    authorize @service
    @service = Service.new(service_params)
    @service.save
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
    params.require(:service).permit(:name,:helpies, :rating, :user_id, :category_id)
  end
end
