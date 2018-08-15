class UniversitiesController < ApplicationController

  def index
    @universities = University.where('name iLIKE ?', "%#{params[:term]}%")

    # skip_authorization
    skip_policy_scope

    render json: @universities
  end

end
