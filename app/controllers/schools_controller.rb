class SchoolsController < ApplicationController

  def create
    @school = current_user.build_school(school_params)

    if @school.save
      redirect_to root_url
    else
      render json: @school.errors
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :division, address_attributes: [:street, :city, :state, :postcode, :country])
  end
end